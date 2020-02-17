#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <string.h>

#define DATAFILE "out/possibleKeys.txt"
#define BUFSIZE 1024

int main(int argc, char *argv[])
{
	FILE *fp = fopen(DATAFILE, "r");
	if (!fp) {
		printf("Can't open file!\n");
		exit(1);
	}

    int epoch;

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
                epoch = atoi(field);
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


        // TODO: run openssl


	}


	return 0;
}