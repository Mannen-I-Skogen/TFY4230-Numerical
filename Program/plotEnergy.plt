clear
reset


set terminal png
set output "./figures/E_002_005.png"
set title 'Total energy per particle of 2 particles'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_002_005.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_002_005.dat' using 1:2 with lines lt 2 lw 2 lc rgb '#0000ff' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_002_005.tex"

replot


clear
reset


set terminal png
set output "./figures/E_003_005.png"
set title 'Total energy per particle of 3 particles'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_003_005.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_003_005.dat' using 1:2 with lines lt 2 lw 2 lc rgb '#0000ff' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_003_005.tex"

replot


clear
reset


set terminal png
set output "./figures/E_004_005.png"
set title 'Total energy per particle of 4 particles'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_004_005.dat" using 2 name "A"
m = ceil(A_max/10)*10
set yrange[0:m]

plot './data/E_004_005.dat' using 1:2 with lines lt 2 lw 2 lc rgb '#0000ff' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_004_005.tex"

replot


clear
reset


set terminal png
set output "./figures/E_005_005.png"
set title 'Total energy per particle of 5 particles'
set xlabel 'T'
set ylabel 'E'
stats "./data/E_005_005.dat" using 2 name "A"
m = ceil((A_max+1)/10)*10
set yrange[0:m]

plot './data/E_005_005.dat' using 1:2 with lines lt 2 lw 2 lc rgb '#0000ff' title "Energy"

set terminal epslatex color
set output "../Report/figures/E_005_005.tex"

replot