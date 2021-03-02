
# The compiler
FC = gfortran -O3 -I#./lapack95#-fopenmp -O3

# Executable to built
PROGRAM = program 

# Source files
SRCS =	common.f95	\
	readinput.f95	\
	functions.f95	\
	main.f95

# Object files
OBJS =	common.o	\
	readinput.o	\
	functions.o	\
	main.o

FLIBS = #-L./lapack95 -llapack95 -llapack -lblas
# 'make' builds all

$(PROGRAM): $(OBJS)
		$(FC) -o $(PROGRAM) $(OBJS) $(FLIBS)

%.mod: %.o %.f95
		$(FC) -c $<

%.o: %.f95
		$(FC) -c $<
%.o: %.f
		$(FC) -c $<

clean:
		rm -f *.o *.mod *~
