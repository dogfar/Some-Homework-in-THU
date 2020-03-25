default:prog3_6 
CC = mpiicc
CFLAGS = -O3 -fopenmp
CLIBS = 
prog3_6:prog3_6.o
	$(CC) $(CLIBS) -fopenmp prog3_6.o -o prog3_6 
prog3_6.o:prog3_6.cpp
	$(CC) $(CFLAGS) -c prog3_6.cpp -o prog3_6.o
clean:
	rm -rf ./*.o prog3_6 
