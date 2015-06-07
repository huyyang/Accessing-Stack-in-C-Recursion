#include <stdlib.h>
#include <stdio.h>

//This function will take in a number and convert that
//number into a hex string using ascii arithmetic. We
//determine each ascii character 1 - 9 and A - F by 
//taking our remainder number we divide from % 16 and
//add it with either 48 or 55. 48 starts at 0 while 55 
//is at 7. Algorithm (NOT CODE) developed by James Ross
void convertToHex(unsigned int);

void recover(){

	//a pointer to itself
	unsigned int * x = (unsigned int*) &x;

	//x goes up to the 24th stack to get the
	//countUp
	x = x + 24;

	//we grab our countUp so we can count
	//how many times we go through our loop
	int countUp = *x;

	//display our countUp but technically is
	//our countdown
	printf("CountDown is: %d\n", countUp);	

	//we go to our first set of arguments
	//from foo
	x = x + (countUp * 16);	
	
	//declare integer J inthe for loop
	int j;

	//a for loop that will loop through how
	//many times we go through the loop and
	//that is our countdown
	for(j = 0; j < countUp + 1; ++j){

		printf("foo called with args: \n");	
		//we go to our first argument a
		// in the stack then print out
		//the hex value
		x = x - 3;
		printf("a: ");
		convertToHex(*x);

		//we go to our second argument
		//in the stack then print ou the
		//hex value
		x = x + 1;
		printf("b: ");
		convertToHex(*x);
		
		//we go to our third argument
		//in the stack then print out
		//the hex value
		x = x + 1;
		printf("c: ");
		convertToHex(*x);
		
		//this is the offset to use to 
		//go to the next recursive call
		//in the stack
		x = x - 15;

		printf("\n");

	}

}

//This function will take in a number and convert that
//number into a hex string using ascii arithmetic. We
//determine each ascii character 1 - 9 and A - F by 
//taking our remainder number we divide from % 16 and
//add it with either 48 or 55. 48 starts at 0 while 55 
//is at 7. Algorithm (NOT CODE) developed by James Ross
void convertToHex(unsigned int num){

	//integer starts at 1 because we are going to 
	//reverse our hexadecimal at the end
	int i = 1;

	//a variable that will be used to store our
	//new remainder
	int takeNumber;

	//a character array that will be able to store
	//the numbers and by default translate them to
	//ascii characters
	char hexConvert[20];


	//a do while loop that will loop until number is
	//at 0
	do{
		//we take the reminder of our passed in 
		//number and modulo by 16 taking the remainder.
		//The reason why we take 16 is because hex is
		//base 16. We want to take the remainder of the
		//value after it has been taken down (modulo)
		takeNumber = num % 16;

		//if the number is less than 10 than we will
		//add that by 48 in which starts at 0. This is
		//the loop that determines how to obtain our
		//ascii character from the integer
		if(takeNumber < 10)
			takeNumber = takeNumber + 48;
		//if the number is more than 10 than we will
		//add that up by 55 in which starts at 7.
		else
			takeNumber = takeNumber + 55;
		
		//whatever the index of the array is we will
		//add our revised number into that index of the
		//array in which will convert into a hex value
		hexConvert[i] = takeNumber;

		//we take our current passed in number and 
		//divide that by 16 because of the base 16
		//representation of hex. We need to know what
		//the remainder is. 
		num = num / 16;

		//increment i for do while
		i++;

	//while the passed in number is not 0
	}while(num != 0);

	//declare variable j for for loop
	int j;	

	//the for loop didn't work the first time using 
	//for(j = 0; j < 0; ++j) because what I have taken
	//notice was that it's totally backwards. We have
	//to reverse the hex string so we can obtain the
	//correct values. 
	for(j = i - 1; j > 0; j--){
		//using putchar to print each hex value
		putchar(hexConvert[j]);
	}
	printf("\n");

}
/*
void convertToHex(int num){

	long int quotient;
	int i=1, j, temp;
	char hexadecimalNumber[100];
	quotient = num;

	while(quotient != 0){

		temp = quotient % 16;
		if(temp < 10)
			temp = temp + 48;
		else
			temp = temp + 55;

		hexadecimalNumber[i++] = temp;
		quotient = quotient / 16;
	}
	
	for(j = i - 1; j > 0; j--){
		putchar(hexadecimalNumber[j]);
	}
	printf("\n");
}
*/

































