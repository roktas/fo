#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int
main(void)
{
	pid_t pid;

	pid = fork();
	if (pid > 0)
		printf("parent %d\n", pid); /* in parent */
	else if (!pid)
		printf("child\n");          /* in child */
	else if (pid == -1) {
		perror("fork");
		exit(EXIT_FAILURE);
	}

	return EXIT_SUCCESS;
}
