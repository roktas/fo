#   Git - Tarifler

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

[http://roktas.me/](http://roktas.me/)

Nisan 2012

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
