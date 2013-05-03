#   Git - Tarifler

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

http://roktas.me/

Nisan 2012

---

#   Gist Çalışma Akışı

*   Güvenlik düzeyi düşük bir çalışma ortamında (örneğin bir bilgisayar
    laboratuvarı) Git ile çalışmalarınızı kayıt altında tutmak istiyoruz

*   Ortamın en azından tuş kaydediciler (keylogger) içermeyecek kadar güvenli
    olduğunu varsayıyoruz

*   Oluşturacağınız Git deposu yazılabilir olmalı

*   SSH şemasını kullanamazsınız çünkü SSH anahtarları ele geçirilebilir

*   HTTPS şemasını kullanmalıyız

*   Ama her `git push` işleminde parola girmek de istemiyoruz

---

#   Merge

*   Merge conflict varsa:

        !sh
        $ git merge --abort

    (Öncesinde depo temiz durumda olmalı.  Bu komut pull için de geçerli)

*   Merge ayarları

        !sh
        $ git config branch.<branch>.mergeoptions "-Xsubtree='foo'"

*   `--squash` ile tek komit halinde alınır

*   TODO `--ff`, `--no-ff` konusu

*   `-s theirs` ile onlarınkini al, `-s ours` ile bizimki

---

#   Pull

*   Ortaklaşa komitlenen bir dalda "göndermeden önce yerel kopyayı
    güncelleyeyim" için şu tavsiye ediliyor:

        !sh
        $ git pull --rebase

    http://stackoverflow.com/questions/2472254/when-should-i-use-git-pull-rebase

*   Uzakta ne değişti?

        !sh
        $ git diff origin/master
