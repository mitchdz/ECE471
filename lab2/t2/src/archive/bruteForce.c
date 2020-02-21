#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <string.h>
#include "aes.h"

#define DATAFILE "out/keys.csv"
#define BUFSIZE 1024

#define IV "09080706050403020100A2B2C2D2E2F2"
#define P "255044462d312e350a25d0d4c5d80a34"
#define C "d06bf9d0dab8e8ef880660d2af65aa82"

int main(int argc, char *argv[])
{
	FILE *fp = fopen(DATAFILE, "r");
	if (!fp) {
		printf("Can't open file!\n");
		exit(1);
	}

    long epoch;

	char buf[BUFSIZE];
	int row_count = 1;
	int field_count = 0;
    // read csv file
	while (fgets(buf, BUFSIZE, fp)) {
		field_count = 0;
		row_count++;

        epoch = 0;
        char keyString[50];

        char *field = strtok(buf, ",");
        while (field) {

            if (field_count == 0) { // epoch
                epoch = atol(field);
            }
            if (field_count == 1) { // key
                //remove newline
                strtok(field, "\n");
                sprintf(keyString, "%s", field);
            }
            field = strtok(NULL, ",");
            field_count++;
        }

        // printf("%d: %s\n", epoch, keyString);
        // we have epoch & key, need to convert key to raw hex
        // and run openssl on.

		// printf("%ld -> %s\n", epoch, keyString);

		




	    // FILE *fp;

 		// fp = popen(concat(KEYGENPROGRAM, epochTime), "r");
		// while (fgets(path, sizeof(path), fp) != NULL) {
			
		// 	char outline[2000];
		// 	sprintf(outline, "%d,%s", i, path);

		// 	printf("%s", outline); // print to stdout
		// 	fprintf(outFile, "%s", outline); // print to file
		// }
		// pclose(fp);


	}


	return 0;
}