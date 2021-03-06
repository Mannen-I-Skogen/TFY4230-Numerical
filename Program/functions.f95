Module functions

    Use common
    Implicit None

    Contains

    subroutine initialize(x,y,vx,vy)
        implicit none
        integer :: check, i, j
        real(wp) :: vel, rij, x(:), y(:), vx(:), vy(:)

        if (param%partNum == 1) then
            x(1) = 1
            y(1) = 2
            vel = sqrt(2*param%EPP)
            vx(1) = rand()*2*vel-vel
            vy(1) = (int(rand()*2)*2-1)*sqrt(2*param%EPP-vx(1)**2)
        end if
        if (param%partNum == 2) then
            x(1) = 2
            y(1) = 8
            vx(1) = 1*sqrt(param%EPP)
            vy(1) = -1*sqrt(param%EPP)
            x(2) = 8
            y(2) = 8
            vx(2) = -1*sqrt(param%EPP)
            vy(2) = -1*sqrt(param%EPP)
        end if

        ! --- If there are more than 2 particles
        if (param%partNum > 2) then
            do i = 1, param%partNum
                check = 0
                ! --- add a new particle and check if it is within a distance of 1 of any other and add it again if it is
                do while (check == 0)
                    x(i) = rand()*param%LX
                    y(i) = rand()*param%LY
                    check = 1
                    do j = 1, i-1
                        rij = sqrt((x(i)-x(j))**2+(y(i)-y(j))**2)
                        if (rij < 1) then
                            check = 0
                        end if
                    end do
                end do
                ! --- Set random values for the velocity but with kinetic energy equal EPP
                vel = sqrt(2*param%EPP)
                vx(i) = rand()*2*vel-vel
                vy(i) = (int(rand()*2)*2-1)*sqrt(2*param%EPP-vx(i)**2)
            end do
        end if

    end subroutine

end Module functions
