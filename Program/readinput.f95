Module readinput

    Use common
    Contains

    ! --- Subroutine that reads an input file
    !     and assign values to parameters.
    Subroutine read_input_file()
        Implicit none
        Integer             :: partNum, LX, LY, animate, distr, hcp,&
                            trace, totE, avgK, calibrate, totalrand, maxBoltz
        Real(wp)            :: dt, KK, EPS, time, EPP
        ! --- List of names to look for in the input file.
        !     These are local variables.
        Namelist / parameters / &
        partNum, dt, LX, LY, KK, EPS, EPP, animate, hcp,&
        trace, time, totE, avgK, calibrate, totalrand, distr, maxBoltz

        ! --- Read the input file and assign corresponding values
        !     to named variables.
        open(unit=1, file='input.txt', status='old')
        read(1,nml=parameters)
        close(1)

        ! --- Assign the values read to the parameters (global variables).
        param%distr = distr
        param%avgK = avgK
        param%totE = totE
        param%time = time
        param%trace = trace
        param%animate = animate
        param%partNum = partNum
        param%dt = dt
        param%LX = LX
        param%LY = LY
        param%KK = KK
        param%EPS = EPS
        param%EPP = EPP
        param%calibrate = calibrate
        param%totalrand = totalrand
        param%maxBoltz = maxBoltz
        param%hcp = hcp

    end subroutine read_input_file


end Module readinput
