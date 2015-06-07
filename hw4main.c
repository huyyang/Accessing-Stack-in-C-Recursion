#include <stdio.h>
#include <stdlib.h>

//a function that takes in three integers, a short and a char
int foo (int, short, char, int, int);

void recover ();

//argc and argv are how command line arguments are pssed to main() in C and C++
//argc will be the number of strings pointer to by argv. This will be 1 plus
//the number of arguments. Variables are named argc and argv by convention. 
//Whatever you input into the command line, the arguments are going to be passed
//into the function anyways 
int main (int argc, char ** argv) {

  //declaring three integer variables, a short variable and a char variable
  //Used to pass them into the function foo
  int a, countDown, retVal;
  short b;
  char c;

  //if argc count is not 5 then we will print 
  //exit (-1) indicates that there is an error
  if (argc != 5) {
    printf ("Usage: program <int> <int> <int> <int>\n");
    exit (-1);
  }
  //function atoi() parses the c string str interpreting its content
  //as an integral number which is returned as a value of type int.
  //Converts char into integer. 	
  a = atoi (argv[1]);
  b = atoi (argv[2]);
  c = atoi (argv[3]);
  countDown = atoi (argv[4]);

  printf ("main called with a = %d, b = %d, c = %d, countDown = %d\n", a, b, c, countDown);

  //retVal is an integer that will call foo and foo returns an integer
  retVal = foo (a, b, c, 0, countDown);

  //prints out whatever foo returned
  printf ("foo returns %d\n", retVal);
  return (0);
}


//this function takes in three integers, a short and a char
int foo (int a, short b, char c, int countUp, int countDown) {

  //integer x y and z declared
  int x, y, z;

  //if countdown is null then we will call our recover function
  //and we will return our passed in integer variable declared a
  if (!countDown) {
    recover ();
    return a;
  }

  if (a < 0)			//if a is less than 0
    x = (a << 1) + 1;		//then x = a right shift over by 1 then add the whole thing by 1
  else				//else if a is bigger
    x = a << 1;			//then a just bitshifts by 1
  if (b < 0)			//if by is smaller than 0
    y = (b << 1) + 1;		//b bitshifts right by 1 then add the whole thing by 1
  else				//else if a is bigger
    y = b << 1;			//then y = b bitshift right by 1
  if (c < 0)			//if c is less than 0
    z = (c << 1) + 1;		//then c bitshift left 1 then add whole thing by 1
  else				//else if c is bigger than 0
    z = c << 1;			//then z = c bitshift right by 1
  x ^= b;			
  y ^= c;	
  z ^= a;

  //returns whatever a is + a recursive function foo in which passes in 
  //the latest value of x, y and z, along with countUp adding 1 and countDown decrementing 1
  //this is how countdown will reach to 9. Once it hits 0 we will call the recover function
  //in which will just return a. 
  return a + foo (x,y,z, countUp+1, countDown-1);
}

