#include <stdio.h>
#include <stdlib.h>

#define PROMPT "Enter an integer: "

//changed return type to void
void get_input(char *,int* );

int main()
{
	int* user_input;

	//added this line
	user_input = malloc(255 * sizeof(int));

	get_input(PROMPT,user_input);
	(void) printf("You entered: %d.\n",*user_input); //added a star
	return (0);
}

//changed prototype
void get_input(char *prompt, int* ival)
{
	(void) printf("%s",prompt);
	scanf("%d",ival);
}
