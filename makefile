LIBS=libcma.so
EXES=ma.shared cmaTest debug0.exe debug1.exe exercise12_5.exe
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
cma.o: cma.c cma.h debug.h
	gcc -c cma.c

# part 3
#to run ma.shared type the following: $ export LD_LIBRARY_PATH=.
ma.shared: libcma.so ma.o
	gcc -o ma.shared -L. ma.o -lcma

debug0.o: debug0.c
	gcc -c debug0.c

debug0.exe: debug0.o
	gcc -o debug0.exe debug0.o

debug1.o: debug1.c
	gcc -c debug1.c

debug1.exe: debug1.o
	gcc -o debug1.exe debug1.o

exercise12_5.o: exercise12_5.c
	gcc -c exercise12_5.c

exercise12_5.exe: exercise12_5.o
	gcc -o exercise12_5.exe exercise12_5.o

#problem 7
cmaTest: libcma.so cmaTest.o
	gcc -o cmaTest cmaTest.o -L. -lcma -lm

test: ma.shared cmaTest
	./ma.shared
	./cmaTest 1024

hw7: debug0.exe debug1.exe exercise12.5.exe
	./debug0.exe ./debug1.exe exericise12.5.exe

#problem 8
dist: 
	tar -cvzf HW6.tar ma.c cmaTest.c cma.c cma.h makefile 

# part 4
clean: 
	-rm $(LIBS)
	-rm $(EXES)
	-rm *.o
