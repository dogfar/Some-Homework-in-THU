default:prog3_5 
CC = mpiicc
CFLAGS = -O3 -fopenmp
CLIBS = 
prog3_5:prog3_5.o
	$(CC) $(CLIBS) -fopenmp prog3_5.o -o prog3_5
prog3_5.o:prog3_5.cpp
	$(CC) $(CFLAGS) -c prog3_5.cpp -o prog3_5.o
clean:
	rm -rf ./*.o prog3_5
