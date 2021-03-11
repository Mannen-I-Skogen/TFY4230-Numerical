clear
reset

set terminal png
set output "./figures/P_002_005.png"
set title 'Trajectory of 2 particles'
set xlabel 'x'
set ylabel 'y' rotate by 0
stats "./data/P_002_005.dat" index 1 using 1 name "LX"
stats "./data/P_002_005.dat" index 1 using 2 name "LY"
set size ratio -1
set arrow from 0,0 to 0,LY_max nohead
set arrow from 0,0 to LX_max,0 nohead
set arrow from 0,LY_max to LX_max,LY_max nohead
set arrow from LX_max,0 to LX_max,LY_max nohead
set xrange [-2:LX_max+2]
set yrange [-2:LY_max+2]


plot './data/P_002_005.dat' index 0 using 1:2 with points pt 6 lc rgb '#ff0000' notitle,\
'./data/P_002_005.dat' index 0 using 3:4 with points pt 6 lc rgb '#00ff00' notitle

set terminal epslatex color
set output "../Report/figures/P_002_005.tex"

replot


clear
reset

set terminal png
set output "./figures/P_003_005.png"
set title 'Trajectory of 3 particles'
set xlabel 'x'
set ylabel 'y' rotate by 0
stats "./data/P_003_005.dat" index 1 using 1 name "LX"
stats "./data/P_003_005.dat" index 1 using 2 name "LY"
set size ratio -1
set arrow from 0,0 to 0,LY_max nohead
set arrow from 0,0 to LX_max,0 nohead
set arrow from 0,LY_max to LX_max,LY_max nohead
set arrow from LX_max,0 to LX_max,LY_max nohead
set xrange [-2:LX_max+2]
set yrange [-2:LY_max+2]


plot './data/P_003_005.dat' index 0 using 1:2 with points pt 6 lc rgb '#ff0000' notitle,\
'./data/P_003_005.dat' index 0 using 3:4 with points pt 6 lc rgb '#00ff00' notitle, \
'./data/P_003_005.dat' index 0 using 5:6 with points pt 6 lc rgb '#0000ff' notitle

set terminal epslatex color
set output "../Report/figures/P_003_005.tex"

replot


clear
reset

set terminal png
set output "./figures/P_004_005.png"
set title 'Trajectory of 4 particles'
set xlabel 'x'
set ylabel 'y' rotate by 0
stats "./data/P_004_005.dat" index 1 using 1 name "LX"
stats "./data/P_004_005.dat" index 1 using 2 name "LY"
set size ratio -1
set arrow from 0,0 to 0,LY_max nohead
set arrow from 0,0 to LX_max,0 nohead
set arrow from 0,LY_max to LX_max,LY_max nohead
set arrow from LX_max,0 to LX_max,LY_max nohead
set xrange [-2:LX_max+2]
set yrange [-2:LY_max+2]


plot './data/P_004_005.dat' index 0 using 1:2 with points pt 6 lc rgb '#ff0000' notitle,\
'./data/P_004_005.dat' index 0 using 3:4 with points pt 6 lc rgb '#00ff00' notitle, \
'./data/P_004_005.dat' index 0 using 5:6 with points pt 6 lc rgb '#0000ff' notitle, \
'./data/P_004_005.dat' index 0 using 7:8 with points pt 6 lc rgb '#ff00ff' notitle

set terminal epslatex color
set output "../Report/figures/P_004_005.tex"

replot


clear
reset

set terminal png
set output "./figures/P_005_005.png"
set title 'Trajectory of 5 particles'
set xlabel 'x'
set ylabel 'y' rotate by 0
stats "./data/P_005_005.dat" index 1 using 1 name "LX"
stats "./data/P_005_005.dat" index 1 using 2 name "LY"
set size ratio -1
set arrow from 0,0 to 0,LY_max nohead
set arrow from 0,0 to LX_max,0 nohead
set arrow from 0,LY_max to LX_max,LY_max nohead
set arrow from LX_max,0 to LX_max,LY_max nohead
set xrange [-2:LX_max+2]
set yrange [-2:LY_max+2]


plot './data/P_005_005.dat' index 0 using 1:2 with points pt 6 lc rgb '#ff0000' notitle,\
'./data/P_005_005.dat' index 0 using 3:4 with points pt 6 lc rgb '#00ff00' notitle, \
'./data/P_005_005.dat' index 0 using 5:6 with points pt 6 lc rgb '#0000ff' notitle, \
'./data/P_005_005.dat' index 0 using 7:8 with points pt 6 lc rgb '#ff00ff' notitle, \
'./data/P_005_005.dat' index 0 using 9:10 with points pt 6 lc rgb '#ffff00' notitle

set terminal epslatex color
set output "../Report/figures/P_005_005.tex"

replot