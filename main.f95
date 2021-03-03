
program verlet

        use common
        use functions
        use readinput

        implicit none

        ! --- Setting variables
        Integer                      ::  i, j, k, partNum, steps, LX, LY
        Real(wp)                     ::  start, finish, dt, KK, EPS
        Real(wp), allocatable        ::  x(:), y(:), vx(:), vy(:), ax(:), ay(:), history(:,:), test(:)
        character(len=4)             ::  num

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
        write(*,*) 'LX: ', param%LX
        write(*,*) 'LY: ', param%LY
        write(*,*) 'KK: ', param%KK
        write(*,*) 'EPS: ', param%EPS
        write(*,*) 'Animate: ', param%animate
        write(*,*) 'Trace: ', param%trace
        write(*,*) 'Constants:'
        write(*,*) 'pi', pi
        partNum = param%partNum
        dt = param%dt
        LX = param%LX
        LY = param%LY
        KK = param%KK
        EPS = param%EPS
        ! --- Initialize variable
        steps = int((10.0/dt)+0.1)
        print *, 'steps: ', steps
        print *, 'steps: ', 10.0/dt
        ! --- Allocate arrays
        allocate(x(partNum))
        allocate(y(partNum))
        allocate(vx(partNum))
        allocate(vy(partNum))
        allocate(ax(partNum))
        allocate(ay(partNum))
        allocate(history(2,steps+1))
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
        x(1) = 5
        y(1) = 5
        vx(1) = -10
        vy(1) = 5
        print *, 'Initializing...'
        print *, 'Start values:'
        print *, 'Position:',x, y
        print *, 'Velocity:',vx, vy
        print *, 'Acceleration:',ax, ay
        print *, ''
        history(1,1) = x(1)
        history(2,1) = y(1)
        print *, 'test1'
        print *, history(1,1), history(2,1)
        write(num,100) steps
        100 format(I4.4)
        write(*,*) num
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
                history(1,i+1) = x(1)
                history(2,i+1) = y(1)
                ! --- update the velocities with acceleration at t
                vx(:) = vx(:) + (ax(:)*dt)/2
                vy(:) = vy(:) + (ay(:)*dt)/2

                ax(:) = 0
                ay(:) = 0

                ! --- Calculate the acceleration at t+dt
                do j = 1, partNum

                        ! --- Check if the particle is outside the box
                        if (x(j) > LX) then
                                ax(j) = -KK*(x(j)-LX)
                        elseif (x(j) < 0 ) then
                                ax(j) = -KK*x(j)
                        end if

                        if (y(j) > LY) then
                                ay(j) = -KK*(y(j)-LY)
                        elseif (y(j) < 0) then
                                ay(j) = -KK*y(j)
                        end if

                end do

                ! --- update the velocities with acceleration at t+dt
                vx(:) = vx(:) + (ax(:)*dt)/2
                vy(:) = vy(:) + (ay(:)*dt)/2
        end do

        print *, 'test2'

        if (param%trace == 1) then
        open(1, file = 'trajectory' //num// 'steps.dat')
        do i = 1, steps+1
                write(1,*) history(1,i), history(2,i)
        end do
        close(1)
        end if

        if (param%animate == 1) then
        open(1, file = 'trajectoryAni' //num// 'steps.dat')
        do i = 1, steps
                write(1,*) history(1,i), history(2,i)
                write(1,*)
                write(1,*)
        end do
        write(1,*) history(1,steps+1), history(2,steps+1)
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

