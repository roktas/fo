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
		char *const argv[] = { "sleep", "100", NULL };
		int ret;

		ret = execv("/bin/sleep", argv);
		if (ret == -1) {
			perror("execv");
			exit(EXIT_FAILURE);
		}
	} else if (pid == -1)
		perror("fork");

	if (waitpid(-1, &status, 0) == -1) {
		perror("waitpid");
		exit(EXIT_FAILURE);
	}

	if (WIFEXITED(status))
		printf("Terminated normally with %d.\n", WEXITSTATUS(status));
	if (WIFSIGNALED(status))
		printf("Killed by signal %d.\n", WTERMSIG(status));

	return EXIT_SUCCESS;
}
