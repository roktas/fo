#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int
main(void)
{
	pid_t pid;

	pid = fork();
	if (!pid) {
		char *const argv[] = { "date", "+'%Y'", NULL };
		int ret;

		ret = execv("/bin/date", argv);
		if (ret == -1) {
			perror("execv");
			exit(EXIT_FAILURE);
		}
	} else if (pid == -1) {
		perror("fork");
		exit(EXIT_FAILURE);
	}

	return EXIT_SUCCESS;
}
