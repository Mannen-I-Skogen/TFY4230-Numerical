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
set output "./figures/E_02_0005.png"
set title 'Total energy per particle of 2 particles with dt = 0.005'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_02_0005.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_02_0005.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_02_0005.tex"

replot


clear
reset


set terminal png
set output "./figures/E_10_0005.png"
set title 'Total energy per particle of 10 particles with dt = 0.005'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_10_0005.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_10_0005.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_10_0005.tex"

replot


clear
reset


set terminal png
set output "./figures/E_20_0005.png"
set title 'Total energy per particle of 10 particles with dt = 0.005'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_20_0005.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_20_0005.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_20_0005.tex"

replot

clear
reset


set terminal png
set output "./figures/E_30_0005.png"
set title 'Total energy per particle of 10 particles with dt = 0.005'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_30_0005.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_30_0005.dat' using 1:2 with lines lt 2 lc rgb '#000000' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_30_0005.tex"

replot