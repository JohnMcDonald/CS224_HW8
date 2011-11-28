LIBS=libcma.so
EXES=ma.shared cmaTest
# part 5
.PHONY: all clean 

all: $(EXES)

#part 2
libcma.so: cma.o 
	gcc -shared -o libcma.so cma.o

# part 1/ problem 7
ma.o: ma.c cma.h
	gcc -c ma.c

cmaTest.o: cmaTest.c cma.h
	gcc -c cmaTest.c

#part 1
cma.o: cma.c cma.h
	gcc -c cma.c

# part 3
#to run ma.shared type the following: $ export LD_LIBRARY_PATH=.
ma.shared: libcma.so ma.o
	gcc -o ma.shared -L. ma.o -lcma

#problem 7
cmaTest: libcma.so cmaTest.o
	gcc -o cmaTest cmaTest.o -L. -lcma -lm

test: ma.shared cmaTest
	./ma.shared & ./cmaTest 1024

#problem 8
dist: 
	tar -cvzf HW6.tar ma.c cmaTest.c cma.c cma.h makefile 

# part 4
clean: 
	-rm $(LIBS)
	-rm $(EXES)
	-rm *.o
