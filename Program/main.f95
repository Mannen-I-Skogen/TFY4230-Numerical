
program verlet

        use common
        use functions
        use readinput

        implicit none

        ! --- Setting variables
        Integer                         ::  i, j, k, partNum, steps, LX, LY, seed, initT
        Real(wp)                        ::  start, finish, dt, KK, EPS, time, Kinetic, potential,&
                                            rij, rijsqr, dvdr, aa, EPP, fps
        Real(wp), allocatable           ::  x(:), y(:), vx(:), vy(:), ax(:), ay(:), history(:,:),&
                                            energy(:,:), kineticPP(:,:)
        character(len=4)                ::  num
        character(len=2)                ::  num2

        !--- Initiating the time counter for the entire program
        write(*,*) 'Program starting!'
        call cpu_time(start)
        ! --- Read input file.
        call read_input_file()
        ! --- Now param%partNum, param%dt and so on have values given in the input file.
        ! --- Write to command line a few words to check the parameters have read correctly.
        write(*,*) 'Check parameters.'
        write(*,*) 'partNum: ', param%partNum
        write(*,*) 'dt: ', param%dt
        write(*,*) 'Time: ', param%time
        write(*,*) 'LX: ', param%LX
        write(*,*) 'LY: ', param%LY
        write(*,*) 'KK: ', param%KK
        write(*,*) 'EPS: ', param%EPS
        write(*,*) 'EPP: ', param%EPP
        write(*,*) 'Animate: ', param%animate
        write(*,*) 'Trace: ', param%trace
        write(*,*) 'totE: ', param%totE
        write(*,*) 'allK: ', param%allK
        write(*,*) 'Constants:'
        write(*,*) 'pi', pi
        ! --- Set the parameters to variable names so they are easier to write.
        partNum = param%partNum
        dt = param%dt
        LX = param%LX
        LY = param%LY
        KK = param%KK
        EPS = param%EPS
        EPP = param%EPP
        time = param%time
        ! --- Set seed for random numbers if the seed is initT the seed is set from the system clock,
        ! --- this will make it so that the random numbers are different each run, if the seed is fixed
        ! --- the random numbers will be the same each run. This is good for calibration.
        call system_clock(initT)
        seed = initT
        seed = 48154
        print *, 'seed:', initT
        call srand(seed)
        ! --- Test ---

        ! --- Test random, this prints some random numbers they should be between 0 and 10
        do i = 1, 10
            print *, rand()*10
        end do
        ! --- Initialize variables
        ! --- fps will determine how often the data for the trajectory will be recorded higher number means more data is recorded
        fps = 50
        steps = int((time/dt)+0.1)
        print *, 'steps: ', steps
        print *, 'FPS: ', fps
        ! --- Animation constant is calculated from the fps if the constant is 1 all the steps are recorded,
        ! --- if the constant is for instance 10 then frames 1, 11, 21.... will be recorded.
        print *, 'animation constant: ', steps/(fps*time)
        ! --- Allocate arrays
        allocate(x(partNum))
        allocate(y(partNum))
        allocate(vx(partNum))
        allocate(vy(partNum))
        allocate(ax(partNum))
        allocate(ay(partNum))
        allocate(history(2*partNum,steps))
        allocate(energy(2,steps))
        allocate(kineticPP(partNum,steps))

        ! --- initialize all particles with zeroes
        x(:) = 0
        y(:) = 0
        ax(:) = 0
        ay(:) = 0
        vx(:) = 0
        vy(:) = 0
        history(:,:) = 0.0
        kineticPP(:,:) = 0.0
        ! --- initialize particles
        call initialize(x,y,vx,vy)

        ! ----------------------
        ! --- Calibrate Mode ---
        ! ----------------------
        if (param%calibrate == 1) then
            if (partNum == 1) then
                x(1) = 1
                y(1) = 2
                vx(1) = 10
                vy(1) = -5
            end if
            if (partNum == 2) then
                x(1) = 3
                y(1) = 3
                x(2) = 7
                y(2) = 7
                vx(1) = 5.6
                vy(1) = 5.6
                vx(2) = -5.6
                vy(2) = -5.6
            end if
            open(1, file = './data/initialPos.dat')
            do i = 1, partNum
                write(1,*) x(i), y(i)
            end do
            close(1)
        end if

        print *, 'Initializing...'
        print *, 'Start values:'
        print *, 'Position:', x, y
        print *, 'Velocity:', vx, vy
        print *, 'Acceleration:', ax, ay
        print *, ''

        ! --- Create strings to put in the title of the output files
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
            kineticPP(:,i) = 0.5*(vx(:)**2+vy(:)**2)
            Kinetic = sum(kineticPP(:,i))
            energy(1,i) = dt*i
            energy(2,i) = (kinetic + potential)/partNum
        end do

        if (param%trace == 1) then
            open(1, file = './data/P_'//num2//'_' //num// '.dat')
            do i = 1, steps
                if (modulo(i,int(steps/(fps*time))) == 1 .or. int(steps/(fps*time)) == 1) then
                    write(1,*) history(:,i)
                end if
            end do
            close(1)
        end if

        if (param%animate == 1) then
            open(1, file = './data/animate.dat')
            do i = 1, steps
                if (modulo(i,int(steps/(fps*time))) == 1 .or. int(steps/(fps*time)) == 1) then
                    do j = 1, partNum
                        write(1,*) history(j*2-1,i), history(j*2,i)
                    end do
                    write(1,*)
                    write(1,*)
                end if
            end do
            close(1)
        end if

        if (param%totE == 1) then
            open(1, file = './data/E_'//num2//'_'//num//'.dat')
            do i = 1, steps
                write(1,*) energy(1,i), energy(2,i)
            end do
            close(1)
        end if

        if (param%allK == 1) then
            open(1, file = './data/K_'//num2//'_'//num//'.dat')
                do i = 1, steps
                    write(1,*) energy(1,i), kineticPP(:,i)
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
        deallocate(energy)
        deallocate(kineticPP)
        ! --- Get final time
        call cpu_time(finish)

        ! --- The final word
        write(*,*) 'The run is done!'
        write(*,*) 'Time =', int(finish - start)/60, 'minutes and', mod(finish-start,60.0), 'seconds.'

end program

