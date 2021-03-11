clear
reset

set terminal png size 1024,768
set output "./figures/solidInit.png"
set title 'Hexagonal packing'
set xlabel 'x'
set ylabel 'y' rotate by 0
set size ratio -1
set arrow from 0,0 to 0,10 nohead
set arrow from 0,0 to 10,0 nohead
set arrow from 0,10 to 10,10 nohead
set arrow from 10,0 to 10,10 nohead
set grid
set xtics 1
set ytics 1
set xrange [-2:12]
set yrange [-2:12]


plot './data/solidInit.dat' index 0 using 1:2 with points pt 6 ps 4 lc rgb '#ff0000' notitle

set terminal epslatex color
set output "../Report/figures/solidInit.tex"

replot


set terminal png size 1024,768
set output "./figures/solid_end_10.png"
set title 'Hexagonal packing'
set xlabel 'x'
set ylabel 'y' rotate by 0


plot './data/solid_end_10.dat' index 0 using 1:2 with points pt 6 ps 4 lc rgb '#ff0000' notitle

set terminal epslatex color
set output "../Report/figures/solid_end_10.tex"

replot


set terminal png size 1024,768
set output "./figures/solid_end_15.png"
set title 'Hexagonal packing'
set xlabel 'x'
set ylabel 'y' rotate by 0


plot './data/solid_end_15.dat' index 0 using 1:2 with points pt 6 ps 4 lc rgb '#ff0000' notitle

set terminal epslatex color
set output "../Report/figures/solid_end_15.tex"

replot


set terminal png size 1024,768
set output "./figures/solid_end_20.png"
set title 'Hexagonal packing'
set xlabel 'x'
set ylabel 'y' rotate by 0


plot './data/solid_end_20.dat' index 0 using 1:2 with points pt 6 ps 4 lc rgb '#ff0000' notitle

set terminal epslatex color
set output "../Report/figures/solid_end_20.tex"

replot


set terminal png size 1024,768
set output "./figures/solid_end_24.png"
set title 'Hexagonal packing'
set xlabel 'x'
set ylabel 'y' rotate by 0


plot './data/solid_end_24.dat' index 0 using 1:2 with points pt 6 ps 4 lc rgb '#ff0000' notitle

set terminal epslatex color
set output "../Report/figures/solid_end_24.tex"

replot


set terminal png size 1024,768
set output "./figures/solid_end_05.png"
set title 'Hexagonal packing'
set xlabel 'x'
set ylabel 'y' rotate by 0


plot './data/solid_end_05.dat' index 0 using 1:2 with points pt 6 ps 4 lc rgb '#ff0000' notitle

set terminal epslatex color
set output "../Report/figures/solid_end_05.tex"

replot