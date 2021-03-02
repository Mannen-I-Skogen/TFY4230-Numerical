Module readinput

    Use common
    Contains

    ! --- Subroutine that reads an input file
    !     and assign values to parameters.
    Subroutine read_input_file()
        Implicit none
        Integer             :: partNum, LX, LY
        Real(wp)            :: dt, KK, EPS
        ! --- List of names to look for in the input file.
        !     These are local variables.
        Namelist / parameters / &
        partNum, dt, LX, LY, KK, EPS

        ! --- Read the input file and assign corresponding values
        !     to named variables.
        open(unit=1, file='input.txt', status='old')
        read(1,nml=parameters)
        close(1)

        ! --- Assign the values read to the parameters (global variables).
        param%partNum = partNum
        param%dt = dt
        param%LX = LX
        param%LY = LY
        param%KK = KK
        param%EPS = EPS

    end subroutine read_input_file


end Module readinput
