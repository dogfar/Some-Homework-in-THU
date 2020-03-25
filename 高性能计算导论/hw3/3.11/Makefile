default:T1 
CC = mpiicc
CFLAGS = -O3
CLIBS = 
T1:T1.o
	$(CC) $(CLIBS) T1.o -o T1 
T1.o:T1.c
	$(CC) $(CFLAGS) -c T1.c -o T1.o
clean:
	rm -rf ./*.o T1
