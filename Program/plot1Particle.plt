clear
reset


set terminal png 
set output "./figures/P_001_0001.png"
set title 'Trajectory of 1 particle with $\Delta t = 0.001$'
set xlabel 'x'
set ylabel 'y' rotate by 0
stats "./data/P_001_0001.dat" index 1 using 1 name "LX"
stats "./data/P_001_0001.dat" index 1 using 2 name "LY"
set size ratio -1
set arrow from 0,0 to 0,LY_max nohead
set arrow from 0,0 to LX_max,0 nohead
set arrow from 0,LY_max to LX_max,LY_max nohead
set arrow from LX_max,0 to LX_max,LY_max nohead
set xrange [-2:LX_max+2]
set yrange [-2:LY_max+2]


plot './data/P_001_0001.dat' index 0 using 1:2 with points pt 7 ps 1 lc rgb '#ff0000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/P_001_0001.tex"

replot


clear
reset

set terminal png
set output "./figures/E_001_0001.png"
set title 'Total energy of 1 particle with $\Delta t = 0.001$'
set xlabel 'T'
set ylabel 'E' rotate by 0
stats "./data/E_001_0001.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_001_0001.dat' using 1:2 with lines lt 2 lw 2 lc rgb '#0000ff' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_001_0001.tex"

replot


clear
reset


set terminal png
set output "./figures/P_001_0005.png"
set title 'Trajectory of 1 particle with $\Delta t = 0.005$'
set xlabel 'x'
set ylabel 'y' rotate by 0
stats "./data/P_001_0005.dat" index 1 using 1 name "LX"
stats "./data/P_001_0005.dat" index 1 using 2 name "LY"
set size square
set arrow from 0,0 to 0,LY_max nohead
set arrow from 0,0 to LX_max,0 nohead
set arrow from 0,LY_max to LX_max,LY_max nohead
set arrow from LX_max,0 to LX_max,LY_max nohead

plot './data/P_001_0005.dat' index 0 using 1:2 with points pt 7 ps 1 lc rgb '#ff0000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/P_001_0005.tex"

replot


clear
reset

set terminal png
set output "./figures/E_001_0005.png"
set title 'Total energy of 1 particle with $\Delta t = 0.005$'
set xlabel 'T'
set ylabel 'E' rotate by 0
stats "./data/E_001_0005.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_001_0005.dat' using 1:2 with lines lt 2 lw 2 lc rgb '#0000ff' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_001_0005.tex"

replot


clear
reset


set terminal png
set output "./figures/P_001_0010.png"
set title 'Trajectory of 1 particle with $\Delta t = 0.01$'
set xlabel 'x'
set ylabel 'y' rotate by 0
stats "./data/P_001_0010.dat" index 1 using 1 name "LX"
stats "./data/P_001_0010.dat" index 1 using 2 name "LY"
set size square
set arrow from 0,0 to 0,LY_max nohead
set arrow from 0,0 to LX_max,0 nohead
set arrow from 0,LY_max to LX_max,LY_max nohead
set arrow from LX_max,0 to LX_max,LY_max nohead


plot './data/P_001_0010.dat' index 0 using 1:2 with points pt 7 ps 1 lc rgb '#ff0000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/P_001_0010.tex"

replot


clear
reset

set terminal png
set output "./figures/E_001_0010.png"
set title 'Total energy of 1 particle with $\Delta t = 0.01$'
set xlabel 'T'
set ylabel 'E' rotate by 0
stats "./data/E_001_0010.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_001_0010.dat' using 1:2 with lines lt 2 lw 2 lc rgb '#0000ff' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_001_0010.tex"

replot


clear
reset


set terminal png
set output "./figures/P_001_0020.png"
set title 'Trajectory of 1 particle with $\Delta t = 0.02$'
set xlabel 'x'
set ylabel 'y' rotate by 0
stats "./data/P_001_0020.dat" index 1 using 1 name "LX"
stats "./data/P_001_0020.dat" index 1 using 2 name "LY"
set size square
set arrow from 0,0 to 0,LY_max nohead
set arrow from 0,0 to LX_max,0 nohead
set arrow from 0,LY_max to LX_max,LY_max nohead
set arrow from LX_max,0 to LX_max,LY_max nohead


plot './data/P_001_0020.dat' index 0 using 1:2 with points pt 7 ps 1 lc rgb '#ff0000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/P_001_0020.tex"

replot


clear
reset

set terminal png
set output "./figures/E_001_0020.png"
set title 'Total energy of 1 particle with $\Delta t = 0.02$'
set xlabel 'T'
set ylabel 'E' rotate by 0
stats "./data/E_001_0020.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_001_0020.dat' using 1:2 with lines lt 2 lw 2 lc rgb '#0000ff' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_001_0020.tex"

replot


clear
reset