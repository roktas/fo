/* Nokta çarpım seri (klasik) gerçekleme  */

#include <stdio.h>
#include <stdlib.h>

static int *vector_a;
static int *vector_b;
static long dot_product;

#define VECTOR_LENGTH 100000000
#define RANDOM_RANGE 100000

static void process(void)
{
	long i;
	long sum;

	for (i = 0, sum = 0; i < VECTOR_LENGTH; i++)
		sum += (vector_a[i] * vector_b[i]) % RANDOM_RANGE;
	dot_product = sum;
}

static void init(void)
{
	long i;

	vector_a = (int *) malloc(VECTOR_LENGTH * sizeof(int));
	vector_b = (int *) malloc(VECTOR_LENGTH * sizeof(int));

	for (i = 0; i < VECTOR_LENGTH; i++)
		vector_a[i] = vector_b[i] = random() % RANDOM_RANGE;
}

static void report(void)
{
	printf("Toplam: %ld\n", dot_product);
}

static void shutdown(void)
{
	free(vector_a);
	free(vector_b);
}

int main(void)
{
	init();
	process();
	report();
	shutdown();

	exit(EXIT_SUCCESS);
}
