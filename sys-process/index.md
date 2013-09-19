#   Sistem - Prosesler

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

[http://roktas.me/](http://roktas.me/)

Mart 2013

---

##  `fork`

        !c
        #include <sys/types.h>
        #include <unistd.h>

        pid_t fork(void);

---

##  Proses

.code: code/fork_without_exec/main.c

---

##  `exec`

        !c
        #include <unistd.h>

        int execlp(const char *file, const char *arg, ...);
        int execle(const char *path, const char *arg, ..., char * const envp[]);
        int execv(const char *path, char * const argv[]);
        int execvp(const char *file, char * const argv[]);
        int execve(const char *file, char * const argv[], char * const envp[]);

---

##  Proses

.code: code/fork_exec_without_wait/main.c

---

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

---

##  Proses

.code: code/fork_zombie_child/main.c

---

##  Proses

.code: code/fork_orphaned_child/main.c

---

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

---

##  Proses

.code: code/fork_exec_with_wait/main.c

---

##  Proses

.code: code/fork_exec_signaled/main.c
