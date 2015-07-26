main : main.o AAA.o
	gcc -o main main.o AAA.o -I.

main.o : main.cpp AAA.h
	gcc -c -o main.o main.cpp -I.

AAA.o : AAA.cpp AAA.h
	gcc -c -o AAA.o AAA.cpp -I.
clean:
	rm -rf *.o
