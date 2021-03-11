clear
reset

set term gif size 1024,768 animate delay 2
set output "./figures/Animation.gif"
stats "./data/animate.dat" name "A"
stats "./data/animate.dat" index A_blocks-1 using 1 name "LX"
stats "./data/animate.dat" index A_blocks-1 using 2 name "LY"

set size ratio -1
set arrow from 0,0 to 0,LY_max nohead
set arrow from 0,0 to LX_max,0 nohead
set arrow from 0,LY_max to LX_max,LY_max nohead
set arrow from LX_max,0 to LX_max,LY_max nohead
set yrange [-2:12]
set xrange [-2:12]
set xlabel 'x'
set ylabel 'y' rotate by 0
set xtics 1
set ytics 1
set grid
n = 1

do for [i=0:A_blocks-2] {
stats [-5:10] [-5:10] "./data/animate.dat" index i using 5 name "E" nooutput
n = sprintf('%f',E_max)
plot "./data/animate.dat" index i using 1:2 with points pt 6 ps 8 lc rgb '#ff0000' title "Average kinetic energy per particle = ".(n)
}