#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define KEYSIZE 16
void main(int argc, char *argv[])
{
	int i;
	char key[KEYSIZE];
	srand (atoi(argv[1]));

	for (i = 0; i< KEYSIZE; i++){
		key[i] = rand()%256;
		printf("%.2x", (unsigned char)key[i]);
	}
	printf("\n");
}
