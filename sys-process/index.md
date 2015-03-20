#   Sistem - Prosesler

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

[http://r.oktas.us/](http://r.oktas.us/)

Mart 2013

##  Kaynak Kod ve Program

Bir yemek makinesi düşünelim

-   Makinenin özel bir dili var

-   "aç", "ölç", "ekle", "karıştır", "ısıt", "bekle"

-   Fakat bu dil biraz karışık

        aç 2 nolu hücre
        ölç 100 gram
        kapat 2 nolu hücre
        ekle
        aç ısıtıcı
        sıcaklık < 100 C°
                bekle

##  Kaynak Kod ve Program

-   Daha **insanî** bir dil lazım → Yüksek seviyeli dil

-   **İnsanî** olan dilde yemek tarifini yazıyoruz → kaynak kod

        100 gram un kat
        100 C° ayarla

-   Bir çevirmen bu dili yemek makinesinin diline çeviriyor → program

        aç 2 nolu hücre
        ölç 100 gram
        kapat 2 nolu hücre
        ekle
        aç ısıtıcı
        sıcaklık < 100 C°
                bekle

##  Kaynak Kod, Program ve Proses

-   Kaynak kod → İnsanî yemek tarifi

-   Program → Yemek makinesinin dilinde yemek tarifi

-   Proses → Tarife göre yapılan yemek

##  Program ve Proses

Program ve Proses ilişkisi

-   Depolama aygıtında pasif → Bellekte aktif

-   Yemek tarifi → Tarife göre yapılan yemek

-   Tek tarif → birden fazla yemek

##  Proses

-   İşletim sistemi proses tablosunda her prosesi takip eder

-   Her prosesin ona atanmış bir numarası var → `pid`

-   Bu numara anahtar kılınarak prosese ait bilgilere erişiliyor

-   Nedir bu bilgiler?

##  Proses

-   Proses numarası

-   Kaydedici değerleri

-   Adres uzayı

-   Açık dosyalar

-   Sinyaller

-   Proses istatistikleri (ne kadar zaman ayrılmış vs)

##  Sinyaller

Örnekler

        !sh
        $ trap 'printf "\nDeğişti\n"' SIGWINCH
        $ trap 'printf "\nKesildi\n"' SIGINT
        $ xeyes &
        $ kill -s SIGSTOP «PID»
        $ kill -s SIGCONT «PID»

##  `getpid` ve `getppid`

        !c
        #include <sys/types.h>
        #include <unistd.h>

        printf("Pid: %d\n", getpid());
        printf("Parent Pid: %d\n", getppid());

##  Proseslerin Hayatı

-   Bir ebeveyn proses çocuk proses doğurur → "fork"

-   Çocuk proses büyür ve yaşar → "exec"

-   Ebeveyn proses çocuk prosesin ölümünü bekler → "wait"

-   Çocuk proses ölür → "exit"

-   Ebeveyn proses ölen çocuğu gömer

##  Proseslerin Hayatı

Unix İşletim sistemlerinde bir prosesin oluşturulması, çalıştırılması ve ölmesi
üç farklı işlem öbeği halinde gerçekleşir.

Bu çok güçlü bir soyutlamadır → "fork", "exec", "wait" semantiği

##  `fork`

        !c
        #include <sys/types.h>
        #include <unistd.h>

        pid_t fork(void);

##  Prosesin Doğuşu

.code: code/fork_without_exec/main.c

##  `exec`

        !c
        #include <unistd.h>

        int execlp(const char *file, const char *arg, ...);
        int execle(const char *path, const char *arg, ..., char * const envp[]);
        int execv(const char *path, char * const argv[]);
        int execvp(const char *file, char * const argv[]);
        int execve(const char *file, char * const argv[], char * const envp[]);

##  `exec`

-   `l` → Liste (fonksiyonun parametre listesi)

-   `v` → Vektör (dizgi dizisi - bir vektör)

-   `p` → `PATH` ortam değişkenini kullan

-   `e` → Ortam ("**E**nvironment") değişkenleri kullan

##  Prosesin Çalıştırılması

-   Mevcut prosesin (ebeveyn) bir kopyası oluşturuluyor

-   Çalıştırılacak program bu kopyanın üzerine bindiriliyor

-   Fakat "üzerine bindirme" yapılmayan şeyler de var; ebeveyne ait

-   Kopya çalıştırılıyor → çocuk proses

##  Prosesin Çalıştırılması

.code: code/fork_exec_without_wait/main.c

##  Windows ®

        !c
        #include <WinBase.h>

        BOOL WINAPI CreateProcess(
          _In_opt_     LPCTSTR lpApplicationName,
          _Inout_opt_  LPTSTR lpCommandLine,
          _In_opt_     LPSECURITY_ATTRIBUTES lpProcessAttributes,
          _In_opt_     LPSECURITY_ATTRIBUTES lpThreadAttributes,
          _In_         BOOL bInheritHandles,
          _In_         DWORD dwCreationFlags,
          _In_opt_     LPVOID lpEnvironment,
          _In_opt_     LPCTSTR lpCurrentDirectory,
          _In_         LPSTARTUPINFO lpStartupInfo,
          _Out_        LPPROCESS_INFORMATION lpProcessInformation
        );

*   10 parametreli bir sistem çağrısı (gerçekleme `Kernel32.dll`'de)

*   `CreateProcess` dışında ayrıca `CreateProcessAsUser`,
    `CreateProcessWithLogonW`, `CreateProcessWithTokenW`

##  Zombi Çocuk

.code: code/fork_zombie_child/main.c

##  Öksüz Çocuk

.code: code/fork_orphaned_child/main.c

##  `waitpid`

        !c
        #include <sys/types.h>
        #include <sys/wait.h>

        pid_t waitpid(pid_t pid, int *status, int options);

        int WIFEXITED(status);
        int WIFSIGNALED(status);
        int WIFSTOPPED(status);
        int WIFCONTINUED(status);

        int WEXITSTATUS(status);
        int WTERMSIG(status);
        int WSTOPSIG(status);
        int WCOREDUMP(status);

##  Cenazeyi Bekle

.code: code/fork_exec_with_wait/main.c

##  Ölüm Haberi Ver

.code: code/fork_exec_signaled/main.c
