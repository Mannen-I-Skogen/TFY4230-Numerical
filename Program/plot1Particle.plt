clear
reset


set terminal png
set output "./figures/P_01_0000.png"
set title 'Trajectory of 1 particle with dt = 0.001'
set xlabel 'x'
set ylabel 'y'


plot './data/P_01_0000.dat' using 1:2 with points pt 7 ps 1 lc rgb '#ff0000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/P_01_0000.tex"

replot


clear
reset

set terminal png
set output "./figures/E_01_0000.png"
set title 'Total energy of 1 particle with dt = 0.001'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_01_0000.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_01_0000.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_01_0000.tex"

replot


clear
reset


set terminal png
set output "./figures/P_01_0005.png"
set title 'Trajectory of 1 particle with dt = 0.005'
set xlabel 'x'
set ylabel 'y'


plot './data/P_01_0005.dat' using 1:2 with points pt 7 ps 1 lc rgb '#ff0000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/P_01_0005.tex"

replot


clear
reset

set terminal png
set output "./figures/E_01_0005.png"
set title 'Total energy of 1 particle with dt = 0.005'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_01_0005.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_01_0005.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_01_0005.tex"

replot


clear
reset


set terminal png
set output "./figures/P_01_0010.png"
set title 'Trajectory of 1 particle with dt = 0.01'
set xlabel 'x'
set ylabel 'y'


plot './data/P_01_0010.dat' using 1:2 with points pt 7 ps 1 lc rgb '#ff0000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/P_01_0010.tex"

replot


clear
reset

set terminal png
set output "./figures/E_01_0010.png"
set title 'Total energy of 1 particle with dt = 0.01'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_01_0010.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_01_0010.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_01_0010.tex"

replot


clear
reset


set terminal png
set output "./figures/P_01_0020.png"
set title 'Trajectory of 1 particle with dt = 0.02'
set xlabel 'x'
set ylabel 'y'


plot './data/P_01_0020.dat' using 1:2 with points pt 7 ps 1 lc rgb '#ff0000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/P_01_0020.tex"

replot


clear
reset

set terminal png
set output "./figures/E_01_0020.png"
set title 'Total energy of 1 particle with dt = 0.02'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_01_0020.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_01_0020.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_01_0020.tex"

replot


clear
reset