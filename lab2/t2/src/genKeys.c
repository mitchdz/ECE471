#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//#define T1 1524024529
#define T2 1524031729
#define T1 1524024529


#define KEYSIZE 16
void main(int argc, char *argv[])
{
	printf("epoch,key\n");
	for (unsigned long long j = T1; j <= T2; j++) {
		printf("%ld,", j);
		int i;
		char key[KEYSIZE];
		srand (j);

		for (i = 0; i< KEYSIZE; i++){
			key[i] = rand()%256;
			printf("%.2x", (unsigned char)key[i]);
		}
		printf("\n");
	}
}
