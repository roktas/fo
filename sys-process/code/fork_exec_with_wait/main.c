#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int
main(void)
{
	pid_t pid;
	int status;

	pid = fork();
	if (!pid) {
		char *const argv[] = { "false", NULL };
		int ret;

		ret = execv("/bin/date", argv);
		if (ret == -1) {
			perror("execv");
			exit(EXIT_FAILURE);
		}
	} else if (pid == -1)
		perror("fork");

	if (waitpid(pid, &status, 0) == -1) {
		perror("waitpid");
		exit(EXIT_FAILURE);
	}

	if (WIFEXITED(status))
		printf("Terminated normally with %d.\n", WEXITSTATUS(status));
	else
		printf("Terminated abnormally.\n");

	return EXIT_SUCCESS;
}
