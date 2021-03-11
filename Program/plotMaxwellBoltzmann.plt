clear
reset

set terminal png
set output "./figures/MB.png"
set title 'Maxwell Boltzmann'
stats './data/MB.dat' index 1 name "A"
kt = A_max
f(x) = sqrt(1/(2*pi*kt))*exp(-(x**2)/(2*kt))
set ylabel "Probability"
set xlabel "$v_x$"
set xrange[-15:15]

plot './data/MB.dat' index 0 using 1:2 with boxes lc rgb '#ff0000' title "Numerical Values", \
f(x) with lines lw 2 lc rgb '#0000ff' title "Theoretical"

set terminal epslatex color
set output "../Report/figures/MB.tex"

replot