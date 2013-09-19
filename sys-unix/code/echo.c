#include <stdlib.h>
#include <stdio.h>

#define SEPARATOR ' '
#define NEWLINE '\n'

int
main(int argc, char *argv[])
{
	int i;
	for (i = 1; i < argc; i++) {
		if (i > 1)
			putchar(SEPARATOR);
		printf("%s", argv[i]);
	};
	putchar(NEWLINE);
	exit(EXIT_SUCCESS);
}
