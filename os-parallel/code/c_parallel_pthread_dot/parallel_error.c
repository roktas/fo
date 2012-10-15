/* Evreli nokta çarpımı için hatalı örnek */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>  /* uintptr_t için */
#include <pthread.h> /* pthread_* işlevleri için */

/*
 * Test amaçlı olarak kullanacağımız vektörlerin boyu.
 */
#define VECTOR_LENGTH 100000000
/*
 * Tamsayılar hangi aralıkta olsun?
 */
#define RANDOM_RANGE 100000

/*
 * Kaç evre (thread) kullanılsın?
 */
#define NTHREAD 4

/*
 * Test vektörünü her evre başına bir aralık düşürecek şekilde
 * bölüyoruz.  İlgili aralık uzunluğu ne olmalı?
 */
#define VECTOR_LENGTH_PER_THREAD (VECTOR_LENGTH/NTHREAD)

/*
 * Test vektörleri.
 */
static int *vector_a;
static int *vector_b;

/*
 * Sonuç.
 */
static long dot_product;

/*
 * Tüm evreler arasında paylaşılan karşılıklı dışlayıcı.
 */
static pthread_mutex_t mutex_dot_product;

/* Test vektörlerini ilkle. */
static void init(void) { long i;
	/*
	 * VECTOR_LENGTH uzunluğunda iki tamsayı vektörü oluştur ve
	 * vektörleri test amaçlı olarak [0, RANDOM_RANGE] aralığında
	 * rastgele tamsayı değerleriyle doldur.
	*/
	vector_a = (int *) malloc(VECTOR_LENGTH * sizeof(int));
	vector_b = (int *) malloc(VECTOR_LENGTH * sizeof(int));

	for (i = 0; i < VECTOR_LENGTH; i++)
		vector_a[i] = vector_b[i] = random() % RANDOM_RANGE;
}

/* Test vektörlerinin nokta çarpımını al (bu bir evre). */
static void *process(void *arg)
{
	/*
	 * Evre oluşturulurken ilgili evre sırası bir void işaretçide
	 * taşınarak bu işleve iletiliyor.  Sıra numarasını kullanarak
	 * vektörlerin hangi aralığında çalışacağımızı belirleyeceğiz.
	 * Tabii önce void işaretçiden pozitif tamsayıya döünştürmek
	 * için uygun bir tip tanımlıyoruz.
	 */
	uintptr_t offset;

	long i, start, end;

	/*
	 * Tip dönüşümü.  Örneğin 4 kanallı çalışıyorsak offset değeri
	 * sırayla 0, 1, 2, 3 olacak.
	 */
	offset = (uintptr_t) arg;

	/*
	 * Bu evrenin çalışacağı vektör aralığını, yani başlangıç ve
	 * bitiş indislerini hesapla.
	 */
	start = offset * VECTOR_LENGTH_PER_THREAD;
	end = start + VECTOR_LENGTH_PER_THREAD;

	/*
	 * İşlemi yap.  Burada her evre kendi vektör aralığında bağımsız
	 * şekilde çalışıyor.  Örnek olarak basit bir işlem yapıyoruz:
	 * elemanları çarp, topla ve ilgili aralığa düşür.  Bir tür
	 * "nokta çarpımı".
	 */
	for (i = start; i < end; i++)
		/*
		* DİKKAT!  Hatalı kod.  Evrelerin ortak erişimine açık
		* bir değişkene kardış kullanmadan yazmaya çalışıyoruz.
		* Her çalışmada farklı ve rastgele bir sonuç üretilir.
		*/
		dot_product += (vector_a[i] * vector_b[i]) % RANDOM_RANGE;

	/*
	 * Evre tamamlandı.  pthread_join bu çağrıyı bekliyor.
	 */
	pthread_exit(NULL);
}

/* Sonucu raporla. */
static void report(void)
{
	printf("Toplam: %ld\n", dot_product);
}

/* Test vektörlerini yoket. */
static void shutdown(void)
{
	free(vector_a);
	free(vector_b);
}

int main(void)
{
	/*
	 * Daha sonra void işaretçiye dönüştürülecek bir pozitif tamsayı
	 * gerekiyor.  int veya uint kullanmamalıyız, taşınabilir değil
	 * ve uyarı üretir.  Bunun yerine stdint.h başlığında tanımlı
	 * olan özel bir veritipi kullanıyoruz.  Bu basitçe bir pozitif
	 * tamsayı, öyle ki sorunsuz şekilde void bir işaretçiye
	 * dönüştürülebilir.
	 */
	uintptr_t i;

	/*
	 * Evre dizisi.
	 */
	pthread_t threads[NTHREAD];

	/*
	 * Vektörleri oluştur.
	 */
	init();

	/*
	 * Karşılıklı dışlayıcıyı ("kardış") hazırla.
	 */
	pthread_mutex_init(&mutex_dot_product, NULL);

	/*
	 * Evreleri oluştur ve ilgili işleve bağla.
	 */
	for (i = 0; i < NTHREAD; i++)
		/* tip dönüşümüne dikkat */
		pthread_create(&threads[i], NULL, process, (void *) i);

	/*
	 * Evrelerin tamamlanmasını bekle.
	 *
	 * Her evre kendi işlemini yapıyor.  Sonucu almamız için
	 * katılımcı tüm evrelerin tamamlanmasını beklemeliyiz.
	 * Evreleri görevlendirildikleri işler için bir yere gönderilen
	 * ulaklar gibi düşünün.  Bu ulaklar görevleri tamamlandığında
	 * bir noktada buluşuyorlar ("join").
	 */
	for (i = 0; i < NTHREAD; i++)
		pthread_join(threads[i], NULL);

	/*
	 * Sonucu raporla.
	 */
	report();

	/*
	 * Oluşturulan vektörleri yoket.
	 */
	shutdown();

	/*
	 * Karşılıklı dışlayıcıyı yoket.
	 */
	pthread_mutex_destroy(&mutex_dot_product);

	exit(EXIT_SUCCESS);
}
