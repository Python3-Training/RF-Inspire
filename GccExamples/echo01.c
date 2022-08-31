#include <stdio.h>

int main(int argc, char **argv) {
	for(int ss = 0; ss < argc; ss++) {
		printf("Got ");
		printf(argv[ss]);
		printf("\n");
	}
	return 0;
}