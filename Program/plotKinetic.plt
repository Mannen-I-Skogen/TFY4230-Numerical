clear
reset

set terminal png
set output "./figures/K_010_00.png"
set title 'Time averaged kinetic energy of 10 particles'
set xlabel 'Particle'
set ylabel 'E' rotate by 0
stats "./data/K_010_00.dat" using 4 name "A"
stats "./data/K_010_00.dat" using 2 name "C"
stats "./data/K_010_00.dat" using 1 name "B"

n = ceil((C_max+2)/10)*10
m = ceil((A_max+2)/50)*50
set xrange[0:B_max+1]
set yrange[0:n]
set xtics 1
set boxwidth 0.4
set style fill solid

plot './data/K_010_00.dat' using 3:4 with boxes pt 5 lc rgb '#00ff00' title "Initial",\
'./data/K_010_00.dat' using 1:2 with boxes pt 5 lc rgb '#ff0000' title "Time averaged"

set terminal epslatex color
set output "../Report/figures/K_010_00.tex"

replot


clear
reset

set terminal png
set output "./figures/K_010_01.png"
set title 'Time averaged kinetic energy of 10 particles'
set xlabel 'Particle'
set ylabel 'E' rotate by 0
stats "./data/K_010_01.dat" using 4 name "A"
stats "./data/K_010_01.dat" using 1 name "B"

m = ceil((A_max+2)/50)*50
set xrange[0:B_max+1]
set yrange[0:m]
set xtics 1
set boxwidth 0.4
set style fill solid

plot './data/K_010_01.dat' using 3:4 with boxes pt 5 lc rgb '#00ff00' title "Initial",\
'./data/K_010_01.dat' using 1:2 with boxes pt 5 lc rgb '#ff0000' title "Time averaged"

set terminal epslatex color
set output "../Report/figures/K_010_01.tex"

replot

clear
reset

set terminal png
set output "./figures/K_010_03.png"
set title 'Time averaged kinetic energy of 10 particles'
set xlabel 'Particle'
set ylabel 'E' rotate by 0
stats "./data/K_010_03.dat" using 4 name "A"
stats "./data/K_010_03.dat" using 1 name "B"

m = ceil((A_max+2)/50)*50
set xrange[0:B_max+1]
set yrange[0:m]
set xtics 1
set boxwidth 0.4
set style fill solid

plot './data/K_010_03.dat' using 3:4 with boxes pt 5 lc rgb '#00ff00' title "Initial",\
'./data/K_010_03.dat' using 1:2 with boxes pt 5 lc rgb '#ff0000' title "Time averaged"

set terminal epslatex color
set output "../Report/figures/K_010_03.tex"

replot