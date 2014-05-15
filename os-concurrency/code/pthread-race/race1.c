/*
 * CS170: race2.c
 * adapted from code by Jim Plank
 */

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>

typedef struct {
	int id;
	int size;
	int iterations;
	char *s;
} Thread_struct;

void *infloop(void *x)
{
	int i, j, k;
	Thread_struct *t;

	t = (Thread_struct *) x;

	for (i = 0; i < t->iterations; i++)
	{
		for (j = 0; j < t->size-1; j++)
		{
			t->s[j] = 'A'+t->id;
			/* needed because machines are so darn fast */
			for(k=0; k < 80000; k++);
			/*
			 * alternatively remove loop and use something like:
			 *
			 * 	$ ./main 2 50 200000 | grep 'AB'
			 */
    		}
		t->s[j] = '\0';
		printf("Thread %d: %s\n", t->id, t->s);
	}

	pthread_exit(NULL);
}

int
main(int argc, char **argv)
{
	pthread_t *tid;
	Thread_struct *t;
	void *retval;
	int nthreads, size, iterations, i;
	char *s;

	if (argc != 4)
	{
		fprintf(stderr, "usage: race nthreads stringsize iterations\n");
		exit(1);
	}

	nthreads = atoi(argv[1]);
	size = atoi(argv[2]);
	iterations = atoi(argv[3]);

	tid = (pthread_t *) malloc(sizeof(pthread_t) * nthreads);
	t = (Thread_struct *) malloc(sizeof(Thread_struct) * nthreads);
	s = (char *) malloc(sizeof(char *) * size);

	for (i = 0; i < nthreads; i++)
	{
		t[i].id = i;
		t[i].size = size;
		t[i].iterations = iterations;
		t[i].s = s;
		pthread_create(&(tid[i]), NULL, infloop, &(t[i]));
  	}
	for (i = 0; i < nthreads; i++)
	{
		pthread_join(tid[i], &retval);
	}

	return(0);
}
