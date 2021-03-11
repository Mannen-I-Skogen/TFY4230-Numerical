Module common

  Implicit None

   ! --- Define default precision
  Integer, Parameter :: sp  = KIND(1.0)

  Integer, Parameter :: dp  = KIND(1.0D0)

  Integer, Parameter :: wp  = sp

  Real(wp), parameter :: pi = 4.0*atan(1.0)


  Type :: Parameter_Container
   ! -----------------------------------------------------------
   ! --- This is the container for the simulation parameters ---
   ! -----------------------------------------------------------

     Integer :: partNum, LX, LY, animate, trace, totE,&
                avgK, calibrate, totalrand, distr, maxBoltz, hcp
     Real(wp) :: pi, dt, KK, EPS, EPP, time

  end Type Parameter_Container

  ! --- The shared container named param.
  Type(Parameter_Container), Save :: param

end Module common
