#include <stdio.h>

int main()
{
	int a, b=0, c=10;
	 
	do {
	 printf("Give an integer please:");
	 scanf("%d", &a);
	 } while (a <= 0);
	 
	while (b!=a) { 
	 b++;
	 printf("\n b = %d", b);
	 if (c>a) {
	 	a++;
	 	printf("\n a = %d", a);
	 	}
	 else{
	 	c++;
	 	printf("\n c = %d", c);
	 	} 
	}
	 
	if (a==b && c!=b) {
		c++;
		printf("\nSecond if statement");
	} 
	else {
		c=b;
		printf("\Second else statement");	
	} 
	
	if (c>50) {
		c=c+a;
		printf("\nThird if statement");
	}
	
	printf ("\nNumber is %d \n", c);
	
	return 0;
}
