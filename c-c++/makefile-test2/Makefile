all : main

test.o : test.c
	gcc -c -o $@ $^

main.o : main.c
	gcc -c -o $@ $^

main : main.o test.o
	gcc -o $@ $^

clean :
	rm -f *.o
