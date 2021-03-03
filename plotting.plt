clear
reset

set terminal png
set output "./figures/trajectory0050steps.png"
set title 'Trajectory with 50 steps (dt = 0.2)'
set xlabel 'x'
set ylabel 'y'


plot 'trajectory0050steps.dat' using 1:2 with points pt 6 lc rgb '#000000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/trajectory0050steps.tex"

replot

set terminal png
set output "./figures/trajectory0100steps.png"
set title 'Trajectory with 100 steps (dt = 0.1)'
set xlabel 'x'
set ylabel 'y'


plot 'trajectory0100steps.dat' using 1:2 with points pt 6 lc rgb '#000000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/trajectory0100steps.tex"

replot

set terminal png
set output "./figures/trajectory0250steps.png"
set title 'Trajectory with 250 steps (dt = 0.04)'
set xlabel 'x'
set ylabel 'y'


plot 'trajectory0250steps.dat' using 1:2 with points pt 6 lc rgb '#000000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/trajectory0250steps.tex"

replot

set terminal png
set output "./figures/trajectory0500steps.png"
set title 'Trajectory with 500 steps (dt = 0.02)'
set xlabel 'x'
set ylabel 'y'


plot 'trajectory0500steps.dat' using 1:2 with points pt 6 lc rgb '#000000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/trajectory0500steps.tex"

replot


set terminal png
set output "./figures/trajectory1000steps.png"
set title 'Trajectory with 1000 steps (dt = 0.01)'
set xlabel 'x'
set ylabel 'y'


plot 'trajectory1000steps.dat' using 1:2 with points pt 6 lc rgb '#000000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/trajectory1000steps.tex"

replot



set terminal png
set output "./figures/trajectory2000steps.png"
set title 'Trajectory with 2000 steps (dt = 0.005)'
set xlabel 'x'
set ylabel 'y'


plot 'trajectory2000steps.dat' using 1:2 with points pt 6 lc rgb '#000000' title "Trajectory"

set terminal epslatex
set output "../Report/figures/trajectory2000steps.tex"

replot