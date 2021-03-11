
program verlet

        use common
        use functions
        use readinput

        implicit none

        ! --- Setting variables
        Integer                         ::  i, j, k, partNum, steps, LX, LY, seed, initT, distr,&
                                            check, ind, prec, tempI, hcp
        Real(wp)                        ::  start, finish, dt, KK, EPS, time, Kinetic, potential,&
                                            rij, rijsqr, dvdr, aa, EPP, fps, substart, subfinish,&
                                            vel, temp, extra
        Real(wp), allocatable           ::  x(:), y(:), vx(:), vy(:), ax(:), ay(:), history(:,:),&
                                            energy(:,:), kineticPP(:,:), velocityOne(:), velDist(:,:)
        character(len=4)                ::  charDT
        character(len=3)                ::  charPartNum, charTime
        character(len=2)                ::  charDistr, charEPP

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
        write(*,*) 'avgK: ', param%avgK
        write(*,*) 'totalrand: ', param%totalrand
        write(*,*) 'distr: ', param%distr
        write(*,*) 'hcp: ', param%hcp
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
        distr = param%distr
        hcp = param%hcp
        if (hcp == 1) then
            partNum = 19
            LX = 10
            LY = 10
        end if
        ! --- Set seed for random numbers if the seed is initT the seed is set from the system clock,
        ! --- this will make it so that the random numbers are different each run, if the seed is fixed
        ! --- the random numbers will be the same each run. This is good for calibration.
        call system_clock(initT)
        seed = initT
        if (param%totalrand == 0) then
            seed = 18467
        end if
        print *, 'seed:', seed
        call srand(seed)

        ! --- Initialize variables
        ! --- fps will determine how often the data for the trajectory will be recorded
        ! --- higher number means more data is recorded
        fps = 40
        steps = int((time/dt)+0.1)
        print *, 'steps: ', steps
        print *, 'FPS: ', fps
        ! --- Animation constant is calculated from the fps if the constant is 1 all the steps are recorded,
        ! --- if the constant is for instance 10 then frames 1, 11, 21.... will be recorded.
        print *, 'animation constant: ', steps/(fps*time)
        print *, 'animation frames: ', fps*time
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
        allocate(velocityOne(steps))

        ! --- initialize all particles with zeroes
        x(:) = 0.0
        y(:) = 0.0
        ax(:) = 0.0
        ay(:) = 0.0
        vx(:) = 0.0
        vy(:) = 0.0
        history(:,:) = 0.0
        kineticPP(:,:) = 0.0
        ! --- initialize particles
        if (hcp .ne. 1) then
            call initialize(x,y,vx,vy)
        end if

        ! -----------
        ! --- HCP ---
        ! -----------

        if (hcp == 1) then
            do i = 1, 5
                x(i) = i+2
                y(i) = 5
            end do
            do i = 6, 12, 2
                x(i) = (i/2)+0.5
                x(i+1) = (i/2)+0.5
                y(i) = 5 + sqrt(3.0)/2
                y(i+1) = 5 - sqrt(3.0)/2
            end do
            do i = 14, 18, 2
                x(i) = (i/2)-3
                x(i+1) = (i/2)-3
                y(i) = 5 + sqrt(3.0)
                y(i+1) = 5 - sqrt(3.0)
            end do
            do i = 1, partNum
                vel = sqrt(2*EPP)
                vx(i) = rand()*2*vel-vel
                vy(i) = (int(rand()*2)*2-1)*sqrt(2*EPP-vx(i)**2)
            end do
            open(1, file = './data/solidInit.dat')
            do i = 1, partNum
                write(1,*) x(i), y(i)
            end do
            close(1)
        end if

        do i = 1, partNum
            write(*,*) vx(i), vy(i)
        end do

        ! ----------------------
        ! --- Calibrate Mode ---
        ! ----------------------
        if (param%calibrate == 1) then
            if (partNum == 1) then
                x(1) = 1.5
                y(1) = 2.5
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
            write(1,*)
            write(1,*)
            write(1,*) LX, LY
            close(1)
        end if

        ! --- Create strings to put in the title of the output files
        print *, 'OUTPUT TITLE CREATION:'
        write(charDT,100) int((time/steps)*1000+0.1)
        100 format(I4.4)
        write(charPartNum,110) partNum
        110 format(I3.3)
        write(charTime,120) int(time+0.1)
        120 format(I3.3)
        write(charDistr,130) distr
        130 format(I2.2)
        write(charEPP,140) int(EPP*10)
        140 format(I2.2)
        write(*,*) 'dt: ', charDT
        write(*,*) 'particles: ', charPartNum
        write(*,*) 'time: ', charTime
        write(*,*) 'distr: ', charDistr
        write(*,*) 'EPP: ', charEPP

        ! ------------------------
        ! --- Simulation Start ---
        ! ------------------------
        call cpu_time(substart)
        do i = 1, steps
            x(:) = x(:) + vx(:) * dt + (ax(:) * dt**2)/2
            y(:) = y(:) + vy(:) * dt + (ay(:) * dt**2)/2
            ! --- update the velocities with acceleration at t
            vx(:) = vx(:) + (ax(:)*dt)/2
            vy(:) = vy(:) + (ay(:)*dt)/2
            velocityOne(i) = vx(1)

!            if (hcp == 1 .and. modulo(i,steps/10) == 0) then
!                vx(:) = vx(:)*1.1
!                vy(:) = vy(:)*1.1
!            end if

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

        ! ----------------------
        ! --- Simulation end ---
        ! ----------------------
        call cpu_time(subfinish)
        write(*,*) 'Simulation time =', int(subfinish - substart)/60, 'minutes and', mod(subfinish-substart,60.0), 'seconds.'

        write(*,*) '---------------------------'
        write(*,*) 'Kinetic energy distribution'
        print *, 'particle',0,'Initial',0,'Time Average'
        do i = 1, partNum
            print *, i, kineticPP(i,1), sum(kineticPP(i,:))/steps
        end do
        write(*,*) 'Energy per particle'
        write(*,*) energy(2,steps)
        write(*,*) 'Energy Drift'
        write(*,*) (energy(2,steps)-energy(2,1))/energy(2,1)

        if (param%maxBoltz == 1) then
            prec = 1
            print *, maxval(velocityOne), minval(velocityOne)
            print *, floor(minval(velocityOne)*prec), floor(maxval(velocityOne)*prec)
            print *, floor(maxval(velocityOne)*prec) - floor(minval(velocityOne)*prec)+1
            print *, floor(minval(velocityOne)*prec) + abs(floor(minval(velocityOne)*prec))+1,&
                     floor(maxval(velocityOne)*prec) + abs(floor(minval(velocityOne)*prec))+1

            ind = floor(maxval(velocityOne)*prec) + abs(floor(minval(velocityOne)*prec))+1
            print *, ind
            allocate(velDist(ind,2))
            velDist(:,2) = 0.0
            print *, 'test61'
            do i = 1, ind
                velDist(i,1) = (i - float(abs(floor(minval(velocityOne)))*prec)-1)/prec
            end do
            extra = abs(floor(minval(velocityOne)*prec))+1
            do i = 1, steps
                tempI = floor(velocityOne(i)*prec)+extra
                velDist(tempI,2) = velDist(tempI,2) + 1
            end do
            open(1, file = './data/MB.dat')
            do i = 1, ind
                write(1,*) velDist(i,1), velDist(i,2)/steps
            end do
            write(1,*)
            write(1,*)
            write(1,*) sum(kineticPP(1,:))/steps
            close(1)
            deallocate(velDist)
        end if


        ! --------------------
        ! --- Output Block ---
        ! --------------------

        if (param%trace == 1) then
            if (partNum == 1) then
                open(1, file = './data/P_'//charPartNum//'_' //charDT// '.dat')
                do i = 1, steps
                    if (modulo(i,int(steps/(fps*time))) == 1 .or. int(steps/(fps*time)) == 1) then
                        write(1,*) history(:,i)
                    end if
                end do
                write(1,*)
                write(1,*)
                write(1,*) LX, LY
                close(1)
            elseif (partNum > 1) then
                open(1, file = './data/P_'//charPartNum//'_' //charTime// '.dat')
                do i = 1, steps
                    if (modulo(i,int(steps/(fps*time))) == 1 .or. int(steps/(fps*time)) == 1) then
                        write(1,*) history(:,i)
                    end if
                end do
                write(1,*)
                write(1,*)
                write(1,*) LX, LY
                close(1)
            end if
        end if

        if (param%animate == 1) then
            open(1, file = './data/animate.dat')
            temp = sum(kineticPP(:,:))/(partNum*steps)
            do i = 1, steps
                if (modulo(i,int(steps/(fps*time))) == 1 .or. int(steps/(fps*time)) == 1) then
                    do j = 1, partNum
                        write(1,*) history(j*2-1,i), history(j*2,i), sum(kineticPP(:,i))/partNum, energy(2,i), temp
                    end do
                    write(1,*)
                    write(1,*)
                end if
            end do
            write(1,*) LX, LY
            close(1)
        end if

        if (param%totE == 1) then
            if (partNum == 1) then
                open(1, file = './data/E_'//charPartNum//'_'//charDT//'.dat')
                do i = 1, steps
                    write(1,*) energy(1,i), energy(2,i)
                end do
                close(1)
            elseif (partNum > 1) then
                open(1, file = './data/E_'//charPartNum//'_'//charTime//'.dat')
                do i = 1, steps
                    write(1,*) energy(1,i), energy(2,i)
                end do
                close(1)
            end if
        end if

        if (param%avgK == 1) then
            open(1, file = './data/K_'//charPartNum//'_'//charDistr//'.dat')
                do i = 1, partNum
                    write(1,*) i+0.2, sum(kineticPP(i,:))/steps, i-0.2, kineticPP(i,1)
                end do
            close(1)
        end if


        ! --- HCP Output ---

        if (hcp == 1) then
            open(1, file = './data/solid_end_'//charEPP//'.dat')
            do i = 1, partNum
                write(1,*) history(i*2-1,steps), history(i*2,steps)
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
        deallocate(velocityOne)

        ! --- Get final time
        call cpu_time(finish)

        ! --- The final word
        write(*,*) 'The run is done!'
        write(*,*) 'Time =', int(finish - start)/60, 'minutes and', mod(finish-start,60.0), 'seconds.'

end program

