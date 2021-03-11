clear
reset

set terminal png
set output "./figures/P_002_200.png"
set title 'Trajectory of 1 particles in a system of 2 particles'
set xlabel 'x'
set ylabel 'y' rotate by 0
stats "./data/P_002_200.dat" index 1 using 1 name "LX"
stats "./data/P_002_200.dat" index 1 using 2 name "LY"
set size ratio -1
set arrow from 0,0 to 0,LY_max nohead
set arrow from 0,0 to LX_max,0 nohead
set arrow from 0,LY_max to LX_max,LY_max nohead
set arrow from LX_max,0 to LX_max,LY_max nohead
set xrange [-2:LX_max+2]
set yrange [-2:LY_max+2]


plot './data/P_002_200.dat' index 0 using 1:2 with points pt 6 lc rgb '#ff0000' notitle

set terminal epslatex color
set output "../Report/figures/P_002_200.tex"

replot


clear
reset

set terminal png
set output "./figures/P_003_200.png"
set title 'Trajectory of 1 particles in a system of 3 particles'
set xlabel 'x'
set ylabel 'y' rotate by 0
stats "./data/P_003_200.dat" index 1 using 1 name "LX"
stats "./data/P_003_200.dat" index 1 using 2 name "LY"
set size ratio -1
set arrow from 0,0 to 0,LY_max nohead
set arrow from 0,0 to LX_max,0 nohead
set arrow from 0,LY_max to LX_max,LY_max nohead
set arrow from LX_max,0 to LX_max,LY_max nohead
set xrange [-2:LX_max+2]
set yrange [-2:LY_max+2]


plot './data/P_003_200.dat' index 0 using 1:2 with points pt 6 lc rgb '#ff0000' notitle

set terminal epslatex color
set output "../Report/figures/P_003_200.tex"

replot


clear
reset

set terminal png
set output "./figures/P_010_200.png"
set title 'Trajectory of 1 particles in a system of 10 particles'
set xlabel 'x'
set ylabel 'y' rotate by 0
stats "./data/P_010_200.dat" index 1 using 1 name "LX"
stats "./data/P_010_200.dat" index 1 using 2 name "LY"
set size ratio -1
set arrow from 0,0 to 0,LY_max nohead
set arrow from 0,0 to LX_max,0 nohead
set arrow from 0,LY_max to LX_max,LY_max nohead
set arrow from LX_max,0 to LX_max,LY_max nohead
set xrange [-2:LX_max+2]
set yrange [-2:LY_max+2]


plot './data/P_010_200.dat' index 0 using 1:2 with points pt 6 lc rgb '#ff0000' notitle

set terminal epslatex color
set output "../Report/figures/P_010_200.tex"

replot

clear
reset

set terminal png
set output "./figures/E_010_200.png"
set title 'Total energy per particle of 10 particles'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_010_200.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_010_200.dat' using 1:2 with lines lt 2 lw 2 lc rgb '#0000ff' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_010_200.tex"

replot


clear
reset

set terminal png
set output "./figures/P_100_200.png"
set title 'Trajectory of 1 particles in a system of 10 particles'
set xlabel 'x'
set ylabel 'y' rotate by 0
stats "./data/P_100_200.dat" index 1 using 1 name "LX"
stats "./data/P_100_200.dat" index 1 using 2 name "LY"
set size ratio -1
set arrow from 0,0 to 0,LY_max nohead
set arrow from 0,0 to LX_max,0 nohead
set arrow from 0,LY_max to LX_max,LY_max nohead
set arrow from LX_max,0 to LX_max,LY_max nohead
set xrange [-2:LX_max+2]
set yrange [-2:LY_max+2]


plot './data/P_100_200.dat' index 0 using 1:2 with points pt 6 lc rgb '#ff0000' notitle

set terminal epslatex color
set output "../Report/figures/P_100_200.tex"

replot

clear
reset

set terminal png
set output "./figures/E_100_200.png"
set title 'Total energy per particle of 10 particles'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_100_200.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_100_200.dat' using 1:2 with lines lt 2 lw 2 lc rgb '#0000ff' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_100_200.tex"

replot