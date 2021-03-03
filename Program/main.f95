
program verlet

        use common
        use functions
        use readinput

        implicit none

        ! --- Setting variables
        Integer                         ::  i, j, k, partNum, steps, LX, LY, seed, S
        Real(wp)                        ::  start, finish, dt, KK, EPS, time, Kinetic, potential, rij, rijsqr, dvdr, aa, EPP, vel
        Real(wp), allocatable           ::  x(:), y(:), vx(:), vy(:), ax(:), ay(:), history(:,:), test(:), energy(:,:)
        character(len=4)                ::  num
        character(len=2)                ::  num2

        !--- Initiating the time counter for the entire program
        write(*,*) 'Program starting!'
        call cpu_time(start)
        ! --- Read input file.
        call read_input_file()
        ! --- Now param%A,B,C have values given in the input file.
        ! --- Write to command line a few words to check the parameters have read correctly.
        write(*,*) 'Check parameters.'
        write(*,*) 'partNum: ', param%partNum
        write(*,*) 'dt: ', param%dt
        write(*,*) 'Time: ', param%time
        write(*,*) 'LX: ', param%LX
        write(*,*) 'LY: ', param%LY
        write(*,*) 'KK: ', param%KK
        write(*,*) 'EPS: ', param%EPS
        write(*,*) 'Animate: ', param%animate
        write(*,*) 'Trace: ', param%trace
        write(*,*) 'totE: ', param%totE
        write(*,*) 'Constants:'
        write(*,*) 'pi', pi
        partNum = param%partNum
        dt = param%dt
        LX = param%LX
        LY = param%LY
        KK = param%KK
        EPS = param%EPS
        time = param%time
        ! --- Set seed for random
        seed = 2187
        call srand(seed)
        ! --- Test random
        ! --- Initialize variable
        steps = int((time/dt)+0.1)
        print *, 'steps: ', steps
        ! --- Allocate arrays
        allocate(x(partNum))
        allocate(y(partNum))
        allocate(vx(partNum))
        allocate(vy(partNum))
        allocate(ax(partNum))
        allocate(ay(partNum))
        allocate(history(2*partNum,steps))
        allocate(energy(2,steps))
        allocate(test(2))

        ! --- initialize all particles with zeroes
        x(:) = 0
        y(:) = 0
        ax(:) = 0
        ay(:) = 0
        vx(:) = 0
        vy(:) = 0
        history(:,:) = 0.0
        ! --- initialize particles
        EPP = 25
        if (partNum == 1) then
            x(1) = 5
            y(1) = 5
            vx(1) = -10
            vy(1) = 5
        end if
        if (partNum == 2) then
            x(1) = 2
            y(1) = 8
            vx(1) = 1*sqrt(EPP)
            vy(1) = -1*sqrt(EPP)
            x(2) = 8
            y(2) = 8
            vx(2) = -1*sqrt(EPP)
            vy(2) = -1*sqrt(EPP)
        end if
        if (partNum > 2) then
            do i = 1, partNum
                x(i) = rand()*10
                y(i) = rand()*10
                vel = sqrt(2*EPP)
                vx(i) = rand()*2*vel-vel
                vy(i) = (int(rand()*2)*2-1)*sqrt(2*EPP-vx(i)**2)
            end do
        end if
        print *, 'Initializing...'
        print *, 'Start values:'
        print *, 'Position:',x, y
        print *, 'Velocity:',vx, vy
        print *, 'Acceleration:',ax, ay
        print *, ''
        write(num,100) int((time/steps)*1000)
        100 format(I4.4)
        write(num2,50) partNum
        50 format(I2.2)
        write(*,*) num
        write(*,*) num2
        ! --- test ground
!    test(1) = 1
!    test(2) = 2
!    print *, 'test'
!    print *, test(:)
!    test(:) = test(:) * 2
!    print *, test(:)
!    print *, 'test over'

        ! ------------------
        ! --- Simulation ---
        ! ------------------
        do i = 1, steps
            x(:) = x(:) + vx(:) * dt + (ax(:) * dt**2)/2
            y(:) = y(:) + vy(:) * dt + (ay(:) * dt**2)/2
            ! --- update the velocities with acceleration at t
            vx(:) = vx(:) + (ax(:)*dt)/2
            vy(:) = vy(:) + (ay(:)*dt)/2

            ax(:) = 0
            ay(:) = 0
            potential = 0
            kinetic = 0

            ! --- Calculate the acceleration at t+dt
            do j = 1, partNum

                history(j*2-1,i) = x(j)
                history(j*2,i) = y(j)
                ! --- Check if the particle is outside the box
                if (x(j) > LX) then
                    ax(j) = -KK*(x(j)-LX)
                    potential = potential + 0.5*KK*(x(j)-LX)**2
                elseif (x(j) < 0 ) then
                    ax(j) = -KK*x(j)
                    potential = potential + 0.5*KK*(x(j))**2
                end if

                if (y(j) > LY) then
                    ay(j) = -KK*(y(j)-LY)
                    potential = potential + 0.5*KK*(y(j)-LY)**2
                elseif (y(j) < 0) then
                    ay(j) = -KK*y(j)
                    potential = potential + 0.5*KK*(y(j))**2
                end if

                do k = j+1, partNum
                    rij = (x(j)-x(k))**2 + (y(j)-y(k))**2
                    rijsqr = sqrt(rij)
                    dvdr = 12*EPS*((1/(rijsqr*(rij**6)))-(1/(rijsqr*(rij**3))))

                    potential = potential + EPS*((1.0/rij**6)-2.0*(1.0/rij**3))

                    aa = dvdr*(x(j) - x(k))/rijsqr
                    ax(j) = ax(j) + aa
                    ax(k) = ax(k) - aa

                    aa = dvdr*(y(j) - y(k))/rijsqr
                    ay(j) = ay(j) + aa
                    ay(k) = ay(k) - aa
                end do

            end do

            ! --- update the velocities with acceleration at t+dt
            vx(:) = vx(:) + (ax(:)*dt)/2.0
            vy(:) = vy(:) + (ay(:)*dt)/2.0
            do j = 1, partNum
                kinetic = kinetic + 0.5*(vx(j)**2+vy(j)**2)
            end do
            energy(1,i) = dt*i
            energy(2,i) = (kinetic + potential)/partNum
        end do

        print *, 'test2'

        if (param%trace == 1) then
            open(1, file = './data/trajectory_'//num2//'particles_' //num// 'dt.dat')
            do i = 1, steps
                write(1,*) history(:,i)
            end do
            close(1)
        end if

        if (param%animate == 1) then
            open(1, file = './data/trajectoryAni_'//num2//'particles_' //num// 'dt.dat')
            do i = 1, steps
                do j = 1, partNum
                    write(1,*) history(j*2-1,i), history(j*2,i)
                end do
                write(1,*)
                write(1,*)
            end do
            close(1)
        end if

        if (param%totE == 1) then
            open(1, file = './data/energy_'//num2//'particles_'//num//'dt.dat')
            do i = 1, steps
                write(1,*) energy(1,i), energy(2,i)
            end do
            close(1)
        end if
        ! --- Deallocate all arrays
        deallocate(x)
        deallocate(y)
        deallocate(vx)
        deallocate(vy)
        deallocate(ax)
        deallocate(ay)
        deallocate(history)
        deallocate(test)
        ! --- Get final time
        call cpu_time(finish)

        ! --- The final word
        write(*,*) 'The run is done!'
        write(*,*) 'Time =', int(finish - start)/60, 'minutes and', mod(finish-start,60.0), 'seconds.'

end program

