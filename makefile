ALL:

1:
	gcc -Wall -O1 -m32 -S hw4main.c;
	gcc -Wall -O1 -m32 -S hw4.c;
	gcc -m32 hw4main.s hw4.s -o hw4;
