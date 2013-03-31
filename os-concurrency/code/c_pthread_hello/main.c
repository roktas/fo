/*
 *
 * Pthread kitaplığıyla "Merhaba Dünya" örneği
 *
 * cc -lpthread ... şeklinde derleyin
 *
 */

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define NUMBER_OF_THREADS 10

void *
print_hello_world(void *tid)
{
	/* This function prints the thread's identifier and then exits. */
	printf("Merhaba Dünya [evre: %d]\n", (intptr_t)tid);
	pthread_exit(NULL);
}

int
main(int argc, char *argv[])
{
	pthread_t threads[NUMBER_OF_THREADS];
	int status, i;

	for (i = 0; i < NUMBER_OF_THREADS; i++) {
		printf("Evre %d oluşturuluyor [main işlevi]\n", i);
		status = pthread_create(&threads[i], NULL, print_hello_world, (void *)(intptr_t)i);

		if (status != 0) {
			fprintf(stderr, "Hata pthread_create: %d\n", status);
			exit(EXIT_FAILURE) ;
		}
	}

	for (i = 0; i < NUMBER_OF_THREADS; i++) {
		status = pthread_join(threads[i], NULL);

		if (status != 0) {
			fprintf(stderr, "Hata pthread_join: %d\n", status);
			exit(EXIT_FAILURE) ;
		}
	}

	exit(EXIT_SUCCESS);
}
