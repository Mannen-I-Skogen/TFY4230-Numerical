
program verlet

    use common
    use functions
    use readinput

    implicit none

    ! --- Setting variables
    Integer     ::  i, j, k, partNum, steps, LX, LY
    Real(wp)    ::  start, finish, dt, KK, EPS
    Real(wp), allocatable :: x(:), y(:), vx(:), vy(:), ax(:), ay(:), history(:,:), test(:)

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
	write(*,*) 'Constants:'
	write(*,*) 'pi', pi
	partNum = param%partNum
	dt = param%dt
	LX = param%LX
	LY = param%LY
	KK = param%KK
	EPS = param%EPS
	! --- Allocate arrays
	allocate(x(partNum))
	allocate(y(partNum))
	allocate(vx(partNum))
	allocate(vy(partNum))
	allocate(ax(partNum))
	allocate(ay(partNum))
	allocate(history(2,steps))
	allocate(test(2))

	! --- Initialize variable
	steps = 2000

	! --- initialize all particles with zeroes
	x(:) = 0
	y(:) = 0
	ax(:) = 0
	ay(:) = 0
	vx(:) = 0
	vy(:) = 0
	history(:,:) = 0.0
	! --- initialize particles
	x(1) = 1
	y(1) = 2
	vx(1) = 10
	vy(1) = -5
	print *, 'Initializing...'
	print *, 'Start values:'
	print *, 'Position:',x, y
	print *, 'Velocity:',vx, vy
	print *, 'Acceleration:',ax, ay
	print *, ''
    history(1,1) = x(1)
    history(2,1) = y(1)
    print *, history(1,1), history(2,1)

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

