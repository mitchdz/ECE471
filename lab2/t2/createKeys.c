#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <string.h>


#define KEYSIZE 16

#define T1 1524024529
#define T2 1524038929

#define outFileName "possibleKeys.txt"


char* concat(const char *s1, const char *s2)
{
    char *result = malloc(strlen(s1) + strlen(s2) + 1); // +1 for the null-terminator
    // in real code you would check for errors in malloc here
    strcpy(result, s1);
    strcat(result, s2);
    return result;
}

int main(int argc, char *argv[])
{
	FILE *fp;
	int i;
	FILE *outFile;
	outFile = fclose(fopen(outFileName, "w")); //clear file
	outFile = fopen(outFileName, "a");

	for (i = T1; i <= T2; i++) {	
		char path[1035];
		char epochTime[20];
		sprintf(epochTime, "%d", i);
		fp = popen(concat("./generate ", epochTime), "r");
		while (fgets(path, sizeof(path), fp) != NULL) {
			
			char outline[100];
			sprintf(outline, "%d,%s", i, path);

			printf(outline); // print to stdout
			fprintf(outFile, outline); // print to file
		}
		pclose(fp);
	}

	fclose(outFile);
	return 0;
}
