#   Sistem

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

http://roktas.me/

Ekim 2012

---

#   UNIX

>  **Those who don't understand UNIX are doomed to reinvent it, poorly.**
>> **Henry Spencer**

---

#   Kullanıcı/Gruplar

---

##  Kimim?

        !sh
        $ id
        uid=1000(roktas) gid=1000(roktas) gruplar=1000(roktas),...

*   `id` komutu `whoami`'dan daha ayrıntılı bilgi görüntülüyor

---

##  `uid`

*   Sistemde her kullanıcıya ait tekil bir no (`uid`) ve isim (`roktas`) var

*   Gerçek kullanıcılara ait kullanıcı no'ların başladığı aralık dağıtımdan
    dağıtıma değişir

*   Debian'da `1000`'den başlar; `0-999` sanal veya özel kullanıcılar için
    rezerve edilmiş

---

##  `gid`

*   Gruplar belirli bir kullanıcı topluluğunun sistem faaliyetlerini toplu halde
    sınırlamak veya genişletmek amacını taşır

*   Her kullanıcının kullanıcı no ve adıyla aynı değerlerde birer grubu da
    vardır → "öz grup"

*   Yani her kullanıcı en az bir gruba, yine kendi adıyla anılan gruba üyedir

*   Ama tersi doğru değil, her grup için o gruba karşı düşen aynı isimde bir
    kullanıcının bulunması gerekmez; gruba üye bir kullanıcı bulunması da
    gerekmez

---

##  Neden Sayılar?

Kullanıcı/grup adları zaten varolduğuna göre neden her şey onlar üzerinden
yürütülmüyor ve böyle sayılar kullanıyoruz?

*   Kullanıcı/grup bilgilerine erişimde birincil anahtar olarak dizgi (string)
    tipindeki kullanıcı/grup adlarını kullanmak maliyetli bir işlem

*   Alt seviye kitaplıklarda, sistem çağrılarında kullanıcı/grup değerlerini
    kopyalamak/atamak karmaşık hale geliyor (bk. `strdup`, `strcpy`; C'de
    dizgilerin bir veri tipi olmadığını unutmayın)

*   Sistem çağrılarında pek çok farklı yerde; örneğin hata kodları, dosya
    betimleyiciler, tamsayıların kullanılmasına yönelik tutarlı ve etkin bir
    tasarım zaten var

Fakat tamsayılar genel olarak geliştiriciler için gerekli; olağan bilgisayar
kullanımında kullanıcı/grup adlarıyla çalışıyoruz

---

##  Sayılar

*   UNIX sistemlerde böyle pek çok yerde tamsayılarla karşılacaksınız

*   Özellikle alt seviyelerde, sistem çağrılarında

*   `uid`/`gid` dışında örneğin prosesler, izinler, dosya betimleyicileri, hata
    kodları

*   `uid`/`gid` örneğinde açıklandığı gibi sayılar yoluyla bilgiyi etkin şekilde
    dolaştırabiliyor, taşıyabiliyoruz

*   Tamsayılar en basit veri türü, veri taşıyıcısı; programatik değeri yüksek

*   Sonuç → etkili, basit, bakımı kolay kodlar

---

#   Dosya Sistemi

---

##  Dosya Sistemi

*   Verileri dosya isimleriyle etiketleyen bir sistem; bir tür adresleme yapıyor

*   Veriler ve isimler; hepsi depolama aygıtında

*   İsimler ve veriler ayrı yerlerde olmalı; veriye erişmek için isimleri
    kullanıyoruz

*   İsimlerden verilere nasıl erişeceğiz?

*   İsimlere erişmek için nasıl bir mekanizma kullanacağız?

*   Tüm isimler önceden bilinen tek bir yerde olabilir veya...

*   Önceden bilinen bir yerde "öncü" ismi bul; sırayla sorarak nihai isme eriş

*   Öncü isim erişmek istediğimiz nihai ismin yerini doğrudan bilmiyor

*   Sadece arayışımızda bir sonraki isim durağını bildiriyor; DNS sistemi gibi

---

##  Dosya Sistemi

        !sh
        /home/roktas/foo.txt

*   Öncü isim? `/`; kök dizini

*   Kök dizin bir sonraki ismin nerede olduğunu bilgisine sahip → `home`

*   Kök dizinin yerini önceden biliyoruz; onu aramaya gerek yok

*   `home` dizini `roktas` dizininin yerini biliyor; o da `foo.txt` dosyasını

*   `foo.txt` ismine ulaştığımızda bu isimle anılan dosyanın tüm verilerini
    (bloklar) okuyabiliriz

---

##  Dosya Nesnesi

*   Verileri ve isimleri ayırdık

*   İsim bilgileri nerede?  Dizinlerde

*   İsim bilgileri?  Bir tür veri

*   Dizin sadece bir fihrist; içerdiği dosya ve diğer dizin isimlerini
    barındıran bir nesne

*   Dosya da veri barındıran bir nesne

*   O halde bir dizine "fihrist" **dosyası** olarak bakabilir miyiz?

*   Dizin → Verileri dosya/dizin isimleri olan dosya

*   Bu bakış açısı olağan dosyalarla, dizinleri tek bir dosya nesnesi olarak
    soyutlamamızı sağlar

---

##  Dizin Fikri

*   Bir dosyanın içeriğine ait veriler depolama aygıtında **sıralı olmayabilen**
    veri blokları halinde kayıtlı

*   Veri bloklarını indisleyebiliriz; ilk veri `36148`'nci blokta gibi

*   O halde dosya bir dizi veri bloğu indisinden oluşan bir sayı topluluğu

*   `foo.txt` → `36148`, `36149`, `36499`, `36500` gibi

*   Dizin verilerinin de (dosya/dizin isimleri) böyle veri bloklarında kayıtlı;
    fakat (dizin çok kalabalık değilse) çoğunlukla tek bir veri bloğu yeterli
    olabilir

*   `home` → `25624` gibi

---

##  `inode` Kavramı

Bu veri bloğu numaralarını nerede tutuyoruz?

*   Örneğin `foo.txt` → `36148`, `36149`, `36499`, `36500`

Veri blokları listesi dışında tutmamız gereken bilgiler olabilir mi?

*   Bu veri blokları topluluğuna ne zaman erişildi?

*   Veriler ne zaman değiştirildi?

*   Veriler hangi kullanıcıya ve gruba ait?

*   Bu veri blokları olağan bir dosya mı yoksa bir dizin mi (içinde dosya
    isimleri barındıran)?

---

##  `inode` Kavramı

Tüm bu bilgileri; yani veri blokları listesi + durum bilgisini tek bir yapı
içinde tutuyoruz → `inode`

*   İsmin kökeni (muhtemelen) "index node"

*   Artık dosya nesnesi dediğimizde bunu `inode` ile somutlaştırıyoruz

*   Dosya nesnesi `inode` ile somutlaşacaksa `inode`'u nasıl somutlaştıracağız?
    `inode` numaralarıyla

*   UNIX sistemlerde tamsayıların her yerde kullanıldığını söylemiştik

*   `inode`'lar da birer tamsayı, öyle ki işletim sistemi bu tamsayıları anahtar
    (indis) olarak kullanarak inode veri yapısına erişebiliyor

        !sh
        $ ls -i /home/roktas/foo.xt
        36148 foo.txt

---

##  Dizin Girdisi

*   İlk inode numarası `/` nesnesini gösteriyor (ilk numara `0` değil; ilgili
    dosya sistemi gerçeklemesine bağlı olarak bu değişebilir)

*   `/home/roktas/foo.txt` dosya yolunda ilerlerken ilk durak `/`

*   `/`'a ait `inode`'da veri blokları bilgisi var; bu blokları okuyoruz

*   Blokları bir araya getirdiğimizde bir tablo elde ediliyor

*   Öyle ki bu tabloda isimler ve o isimlere karşı düşen `inode` numaraları var

Bir dizine ait veri bloklarından oluşan bu tabloya dizin girdisi ("directory
entry") diyoruz

---

##  Dizin Girdisi

Dosya yolunda ilerlemeye devam edelim

*   `home` ismini bul; ilgili `inode`'u ve veri bloklarını oku

*   Tekrar bir dizin girdisi; `foo.txt` ismini ara

*   `foo.txt` ismine karşı düşen `inode`'u oku

*   Ama bu dosyaya erişme hakkına sahip miyiz?

*   Bu bilgi de `inode`'da; böyle bir izin yoksa erişim teşebbüsü sona erer

*   Aksi halde artık `foo.txt`'in veri blokları elimizde; dosyayı belleğe oku

*   Bitti mi?  Hayır

*   Dosyaya erişim yaptığımıza göre erişim zamanını `inode`'a kaydet

---

##  `inode` İçeriği

*   Veri blokları; aslında bu bir işaretçi, sizi daha sonra bir bağlı listeye
    gönderecek bir başka veri yapısına işaret eden bir işaretçi

*   Dosya boyutu (bayt olarak)

*   Dosyayı barındıran depolama aygıtının kimlik numarası

*   Kullanıcı/grup numaraları

*   Erişim hakları bilgisi: kimler okuyabilir/yazabilir/çalıştırabilir?

*   Zaman damgaları: en son ne zaman erişildi, ne zaman değiştirildi?

*   Başvuru sayısı: bu düğüme kaç nesne başvuruda bulunmuş; başvuru sayısı 0 ise
    ilgili veri blokları serbest bırakılır

---

##  Dosya İsimleri ve Durumu

.fx: achtung

**Dosya isimleri `inode`'da tutulmaz!**

*   Bu bilgi dizin girdisinde

*   Dizin girdisi nerede?

*   Dizine ait veri bloklarında

**Dosya durum bilgileri (boyut, erişim zamanı, izinler vs) dizin girdisinde
tutulmaz!**

*   Bu bilgi ilgili dosya nesnesine ait `inode`'da

---

##  Görev

.fx: task

Aynı dosyanın bir başka dosyaya kopyalanması ve taşınması işlemini ele alın

        !sh
        $ cp foo.txt bar.txt
        $ mv foo.txt bar.txt

Bu iki işlemden hangisi daha hızlıdır?  Neden?

---

##  Zaman Damgaları: `atime`

`atime` → Son erişim zamanı ("access time")

*   Dosya okunduğunda, yani `inode`'da listelenen veri bloklarına erişildiğinde
    güncellenir

*   Görüntülemek için `-lu` seçeneğini kullanın; örnekte `atime` → `20:14`

        !sh
        $ ls -lu /home/roktas/foo.txt
        -rw-r--r-- 1 roktas roktas 3 Eki  1 20:14 foo.txt

*   Dosyaya yazmanız çoğunlukla "erişmek" anlamına gelmez; örneğin kırpma veya
    sona ekleme işlemleri

*   Dosya isminin görüntülenmesi de "erişmek" değildir

*   Ama bu son işlem bir başka düğümün erişim zamanını değiştirir, hangisi?

---

##  Zaman Damgaları: `mtime`

`mtime` → Dosya içeriğinin son değiştirilme zamanı ("modify time")

*   Dosyaya yazıldığında, yani `inode`'da listelenen veri bloklarında
    değişiklikler olduğunda güncellenir

*   Görüntülemek için `-l` seçeneğini kullanmanız yeterli (`ls` öntanımlı olarak
    `mtime` zamanını görüntüler); örnekte `mtime` → 20:20

        !sh
        $ ls -l /home/roktas/foo.txt
        -rw-r--r-- 1 roktas roktas 3 Eki  1 20:20 foo.txt

*   Dosyayı okumanız, listelemeniz veya sahibini/grubunu ayarlamanız bu zamanı
    değiştirmez

---

##  Zaman Damgaları: `ctime`

`ctime` → Düğümün son değiştirilme zamanı ("change time"; **dikkat!** create
time değil)

*   Dosya içeriğinde veya `inode` içeriğinde zaman damgası olmayan ögelerden
    herhangi biri; örneğin dosya boyutu, dosya izinleri değiştiğinde güncellenir

*   Görüntülemek için `-lc` seçeneğini kullanın; örnekte `ctime` → `20:32`

        !sh
        $ ls -lc /home/roktas/foo.txt
        -rwxr-xr-x 1 roktas roktas 3 Eki  1 20:32 foo.txt

*   Dosyayı okumanız, listelemeniz bu zamanı değiştirmez

*   `mtime` güncellendiğinde, yani dosya içeriğine dokunulduğunda `ctime` da
    güncellenir

*   Dosyanın sahibi/grubu veya izinleri değiştirildiğinde, dosya isminde
    değişiklik yapıldığında `ctime` güncellenir; `atime` ve `mtime` değişmez

---

##  Zaman Damgaları

.fx: achtung

*   `atime` sadece dosya içeriği okunduğunda (dosya kopyalama da buna dahil)
    güncellenir

*   `mtime` sadece dosya içeriğinde değişiklik olduğunda güncellenir; dosya
    metabilgilerindeki (dosya ismi, sahipler, izinler) değişikliklerden
    etkilenmez

*   `ctime` dosya üzerinde gerçekleşen neredeyse her türlü değişiklikte
    güncellenir

*   UNIX'te dosyanın ilk oluşturulma zamanı bilgisi kaydedilmez

---

##  Başvuru Sayısı

Başvuru sayısı →  İlgili dosya nesnesine referans veren düğüm sayısı

        !sh
        $ mkdir /tmp/t
        $ ls -ld /tmp/t
        drwxr-xr-x 2 roktas roktas 4096 Eki 11 00:17 /tmp/t
        $ touch /tmp/t/f
        $ ls -l /tmp/t/f
        -rw-r--r-- 1 roktas roktas 0 Eki 11 00:17 /tmp/t/f

*   `/tmp/t` dizini başvuru sayısı → 2, `/tmp/t/f` dosyası başvuru sayısı → 1

*   `/tmp/t` dizinine iki düğümden referans veriliyor → `.` ve `..`

*   `/tmp/t/f` dosyasına ise sadece dosyaya ait düğümden referans veriliyor

*   Dizinler en az `2`, dosyalar en az `1` başvuru sayısına sahip

---

##  Dizin Başvuru Sayısı

        !sh
        $ ls -ld /tmp/t
        drwxr-xr-x 2 roktas roktas 4096 Eki 11 00:17 /tmp/t
        $ mkdir /tmp/t/u
        $ ls -ld /tmp/t
        drwxr-xr-x 3 roktas roktas 4096 Eki 11 00:17 /tmp/t

*   Dizinde bulunan alt dizinlerin her biri `..` ile ilgili dizine referans
    verdiğinden dizin başvuru sayısı → `2` + alt dizin sayısı

*   `ln -s` yoluyla dizine yapılan sembolik bağlamalar başvuru sayısını
    etkilemez, neden?

*   `ln` yoluyla dizinlere sabit bağlama zaten yapılamaz

---

##  Dosya Başvuru Sayısı

        $ ls -l /tmp/t/f
        -rw-r--r-- 1 roktas roktas 0 Eki 11 00:17 /tmp/t/f
        $ ln /tmp/t/f /tmp/t/g
        $ ls -l /tmp/t/f
        -rw-r--r-- 2 roktas roktas 0 Eki 11 00:17 /tmp/t/f

*   `ln` komutuyla dosyaya yapılan sabit bağlamalar başvuru sayısını `1` artırır

*   Bir dosyanın başvuru sayısı `1`'den büyükse dosyaya başka dosyalara sabit
    bağlıdır

*   `ln -s` yoluyla dosyaya yapılan sembolik bağlamalar başvuru sayısını
    etkilemez, neden?

---

##  Dosya Başvuru Sayısı

        !sh
        $ ls -ld /tmp/t
        drwxr-xr-x 2 roktas roktas 4096 Eki 11 00:17 /tmp/t
        $ ln /tmp/t /tmp/u
        $ ls -ld /tmp/t
        drwxr-xr-x 3 roktas roktas 4096 Eki 11 00:17 /tmp/t

        $ touch /tmp/t/f
        $ ls -l /tmp/t/f
        -rw-r--r-- 1 roktas roktas 0 Eki 11 00:17 /tmp/t/f

---

##  `echo`

*   POSIX standartlarında tanımlanmış

*   Bu tanımı kılavuza bakarak öğrenebilirsiniz

*   Kılavuz dokümanları ilgili programın bir tür belirtimidir

---

##  `echo(1)`

.code: code/echo.txt

---

##  Kılavuz

*   Kılavuzun anahatlarını dikkatli inceleyin

*   Üst Başlık → Komut (veya konu) kılavuzun hangi bölümünde? Ör. `echo(1)` →
    `1`

*   `NAME` → Kılavuzun (komut/konu) adı ve kısa açıklama

*   `SYNOPSIS` → Kullanımla ilgili özet bilgi

*   `DESCRIPTION` → Uzun açıklama ve seçenekler (bazı kılavuz sayfalarında
    seçenekler ayrı bir `OPTIONS` başlığında olabilir)

*   `SEE ALSO` → Çapraz başvuru; bu kılavuzla ilişkili diğer kılavuzlar

---

##  Kılavuz

Tüm kılavuz sayfalarında geçerli bir anahat yok

*   Fakat hemen her kılavuz sayfasında listelenen bu başlıklar var

*   Bazı kılavuzlarda başka başlıklar da görebilirsiniz

*   `FILES` → Kılavuzda anlatılan yazılımın kullandığı dosyalar; ör.
    yapılandırma dosyaları

*   `ENVIRONMENT` → Yazılımın çalışmasını etkileyen ortam değişkenleri

---

##  Kılavuz: Kısımlar

*   Kılavuz sayfaları kısımlardan oluşuyor

*   Aynı terim birden fazla kısımda bulunabilir

*   En kalabalık kısım `1`

*   UNIX geleneğinde (örneğin bir posta listesinde) bir kişi size `echo(1)`
    demişse bunun anlamı: "Lütfen (önce ödevini yap ve) `echo` kılavuzunu oku"

---

##  `man(1)`

.code: code/man.txt

---

##  Kılavuz: Dosya Biçimleri

*   Kılavuz sadece komutları anlatmaz

*   `5` numaralı kısım dosya biçimlerine ayrılmış

*   Örneğin `passwd` komutu hakkında bilgi almak için

        !sh
        $ man passwd

*   `passwd` komutuna ilişkin `1` numaralı kısımdaki kılavuz sayfası
    görüntülendi

*   Fakat bu kılavuz komutun kullandığı `/etc/passwd` dosyasının biçimi hakkında
    bir şey söylemez

*   Dosya biçimi için `5` numaralı kısma bakmalıyız

        !sh
        $ man passwd 5

---

##  `echo`

.code: code/echo.c

---

##  `echo`

*   Derle

        !sh
        $ cc -o echo echo.c

*   Çalıştır

        !sh
        $ ./echo Merhaba Dünya!

---

##  `which`

*   Sistemde etkin durumda olan bir `echo` komutu daha var

        !sh
        $ which echo
        /bin/echo

*   `which` → Argüman olarak verilen komut girildiğinde çalışacak programın açık
    dosya yolunu görüntüle

*   Yazdığımız `echo` programının çalışmasını nasıl sağladık?

*   Programın dosya yolunu açık şekilde vererek

---

##  `PATH`

*   Komut satırında girilen programlar belirli dizinlerde aranır ve ilk bulunan
    çalıştırılır

*   Aranacak dizinler `:` ayrılmış bir biçimde `PATH` isimli ortam değişkeninde

        !sh
        $ echo $PATH
        /usr/local/bin:/usr/bin:/bin

*   `which` komutu da argüman olarak verilen komutu `PATH` içinde arıyor

*   Bulunduğunuz dizin `PATH`'te tanımlı değildir ve **tanımlı olmamalıdır**,
    neden?

*   `PATH`'te tanımlı olmayan bir programı çalıştırmak için programı açık dosya
    yoluyla yazıyoruz

---

##  Görev

.fx: task

*   `echo` belirtiminde (`echo(1)`) geçen `-n` seçeneğini için tipik bir
    kullanım senaryosu önerebilir misiniz?

*   `echo.c` kodunu esas alarak `-n` seçeneğini gerçekleyin

---

#   Prosesler

---

##  Proses

*   `echo.c` (kaynak kod) → Derle → `echo` (program)

*   `./echo`(program)  → Koştur → **Proses**

*   Program depolama aygıtlarında kayıtlı bir ikili dosya

*   Kabuk yoluyla (koşturma yollarından sadece biri) ikili dosya belleğe
    yüklendi

*   Proses → "Programın bellekteki hali" (biraz somutlaştırmak adına),
    "koşturulan program"

*   Program → sınıf ("class"), Proses → nesne ("object")

*   Bir program kullanıcılar tarafından aynı anda pek çok kez koşturulabilir

*   Tek program → Çok proses

---

##  Proses

*   Kabuğun temel işlevi programları (tanınan adlarla) proseslere dönüştürmek ve
    bu prosesleri yöneten bir arayüz sunmak

*   Sistem çağrılarından oluşan bir mekanizmayla (`fork-exec`) işletim sistemine
    istekte bulunuyor

*   Asıl aktör işletim sistemi; kabuk sadece bir arayüz

*   **Kabuğun kendisi de bir proses!**

*   Sisteme giriş yaptığınızda çalıştırılan bir proses

---

##  `pid`

Her prosesin bir numarası var →  pid: Process ID

*   Parola değiştirme işlemi

        !sh
        $ passwd

*   Komutun ürettiği proses geçerli parolanızı girmeniz için bekliyor

*   Bir başka konsol açarak bu prosesin numarasını öğrenin

        !sh
        $ ps au
        USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
        ...
        root      6302  0.0  0.0  53592  1500 pts/12   S+   15:37   0:00 passwd
        ...

*   pid → `6302`; teknik olarak 16 bitlik bir tamsayı

*   `USER` alanında neden `root` var?  Programı normal kullanıcı hesabıyla
    çalıştırdığım halde

---

##  Prosesin Kimliği

        !sh
        $ ps a -o user,group,ppid,pid,cmd

1.   Prosesin sahibi?  `uid`

2.   Prosesin grubu? `gid`

3.   Prosesi oluşturan ebeveyn proses? `ppid`

4.   Prosesin numarası? `pid`

5.   Proses hangi komutla oluştu?

---

##  Prosesin Kimliği

Bunlar en temel bilgiler (ama daha fazlası da var).  Neden temel?

*   Proses, yani ilgili komut, *genel olarak* sadece sahibine izin verilen işler
    yapabilir (ama bk. `suid` biti)

*   Çocuk proses bazı özellikleri ebeveyn prosesten miras alır

*   Ebeveyn proses öldüğünde *çoğu zaman* çocuk proses de ölür

---

##  `init`

**Kabuğun kendisi de bir proses!**

*   `ps` komutuyla bunu görebiliyor musunuz?

*   Ontolojik problem: peki bu prosesi kim oluşturdu?

*   "`login` işlemini yapan bir program olmalı, odur"

*   Doğru, sistem açılışında `login` prosesi devrede

*   O prosesi kim oluşturdu? `init` prosesi

*   Tüm prosesler işletim sistemi tarafından sistem açılışında oluşturulan ilk
    proses, yani `init` prosesi tarafından oluşturuluyor

*   `init` prosesinin proses numarası → `1`

---

##  Proses Ağacı

        !sh
        $ pstree -p | less

Tüm proseslerin ebeveyni durumundaki `init` prosesini görebiliyor musunuz?

*   `| less`?  Komutun ürettiği çıktı tek ekrana sığmayacağından sayfalanmasını
    sağlıyor (daha sonra üzerinde duracağız)

---

##  `ps`

*   UNIX araç setinde komut satırı seçeneklerinin düzeni açısından en karmaşık
    ve tutarsız programlardan biri

*   Fakat çok güçlü; aşağıdaki kullanımlara elinizi alıştırın

*   Konsollarda çalıştırılan prosesleri kullanıcı bilgileriyle birlikte
    görüntüle

        !sh
        $ ps au

*   Konsoldan ayrılmış arka planda çalışanlar da dahil tüm prosesleri görüntüle

        !sh
        $ ps ax


*   İçinde sadece `<terim>` geçen satırları görüntüle

        !sh
        $ ps ax | grep <terim>

---

##  `top`

        !sh
        $ top

*   Prosesleri canlı şekilde görüntülüyor

*   Pasif görüntüleme dışında işlemler de yapılabilir (örneğin prosesin
    öldürülmesi)

*   Nasıl?  `?` tuşuyla yardım alın

---

##  Prosesin Ölümü

*   Program sonlandığında proses de sonlanır ("eceliyle ölüm")

*   Fakat öldürerek de sonlandırabilirsiniz

        !sh
        $ kill <pid>

*   Proses öldüğünde sisteme bir tamsayı değer döner → çıkış kodu ("exit code")

---

##  Çıkış Kodu

*   `0-255` arasında bir tamsayı

*   `0` → Başarılı, `> 0` → Başarısız

*   Neden böyle bir düzenleme?  Başarı tek, Başarısızlık ise türlü

*   `0` → başarı ve `0`'dan farklı tüm değerler başarısız

*   Öyle ki `0` olmayan tamsayı başarısızlık türünü temsil etsin; yani hata kodu

*   Yaygın kullanımda genellikle sadece başarızlıkla ilgileniriz; programlar
    başarısız olduğunda basitçe `1` değeri döner

*   Fakat bazı kullanım senaryolarında özel hata kodları kullanılabilir

---

##  Çıkış Kodu

.code: code/echo.c

---

##  Çıkış Kodu

*   `main` işlevinin tamsayı döndüğüne dikkat edin!  Standartlarda bu işlevin
    neden `int main()` olarak tanımlandığını artık anlıyor olmalısınız

*   Çıkış kodu hangi satırda?

        !c
        exit(EXIT_SUCCESS);

*   `EXIT_SUCCESS` standart C kitaplığında tanımlı değer → `0`

*   `echo` çok basit bir program; başarısızlık neredeyse ihtimal dışı;
    `EXIT_FAILURE`lık bir durum yok

*   Taşınırlık adına böyle yaptık ama `exit(0)` veya `return 0` da denilebilirdi

---

##  Görev

.fx: task

*   `return 0` ile `exit(EXIT_SUCCESS)` arasında ne fark vardır?

*   Hangisi tercih edilmelidir?

---

##  Çıkış Kodu

.fx: achtung

Lütfen aşağıdaki konvansiyonlara uyun

*   Yazdığınız program hatalı sonlanıyorsa bu durumu `> 0` gibi bir değerle (bu
    bir C kodu ise tercihen `EXIT_FAILURE` makrosuyla) sisteme bildirmeli

*   (Benzer bir hassasiyetle) Hata iletilerini `stdout`'a değil `stderr`'e yazın
    (daha sonra değineceğimiz bir konu)

---

##  Çıkış Kodu

Çıkış kodunu pratikte nasıl kullanırız?

*   Programı derle ve derleme işlemi başarılıysa koştur

        !sh
        $ cc -o echo echo.c && ./echo

*   `cc` konvansiyonlara uygun şekilde kodlanmış bir program; başarısızlık
    halinde `> 0`, başarı halinde `0` değeri dönüyor

*   Kabuk tarafından sunulan `&&` operatörü kendisinden önceki komut başarılı
    ise (`0` çıkış kodu), sonraki komutu çalıştırıyor; aksi halde (`> 0`) işlem
    sonlanıyor

---

#   Kabuk

---

##  Kabuk ve `true`/`false`

`&&` operatörü kendi başına bir programlama dili barındıran kabuğun mantıksal
`AND` operatörü

*   Yani bu bir "kısadevre" ("shorcircuit") operatörü

        !c
        if (<ifade1> && <ifade2>)
                deyim;

*   Şöyle okuyun

        eğer "cc -o echo echo.c" komutu doğru ise
                "./echo" komutunu çalıştır

*   "`cc -o echo echo.c`" ifadesi hangi durumda doğru değer alıyor?  Komut `0`
    değeri döndüğünde

---

##  Kabuk ve `true`/`false`

.fx: achtung

**Kabuk programlama dilinde `true` → `0`, `false` → `0`'dan farklı her değer**

*   Bu tanımın C dilinin tam zıddı olduğuna dikkat edin!

*   Bu ince noktayı kavradığınızda kabuk programlamada önemli engellerden birini
    aşmış olursunuz!

---

##  Kabuk ve `true`/`false`

Diğer senaryolar

*   Çalışmaya bırakılan kritik bir işlem hatayla sonlandığında uyar

        !sh
        $ kritik_işlem || mail -s "kritik_işlem: hata var, çabuk gel!" roktas

*   İşlem her nasıl sonlanırsa sonlansın bir şeyler yap

        !sh
        $ dağınık_işlem ; rm -rf çöpler

---

##  Ortam Değişkenleri

*   Pek çok durumda kabuğa girilen komutlar yeni prosesler üretiyor →
    proseslerle dolu bir ortam

*   Ortam değişkenlerini basitçe kabuk değişkenleri olarak düşünün

*   (Kabuğun kendisi de dahil olmak üzere) Proseslerin davranışını yönlendiren
    değişkenler

*   Bir tür global yapılandırma işlevi görüyor

*   Programlar bazı ayarları (yaygın pratikte ayarların öntanımlı değerlerini)
    komut satırı seçenekleri yerine ortam değişkenlerinden alabilir

---

##  Ortam Değişkenleri

*   Ortam değişkenleri birer kabuk değişkeni, fakat bunları olağan
    değişkenlerden ayıran bir kaç önemli nokta var

*   Ortam değişkenleri tüm çocuk proseslerde etkin olması için ihraç edilmiştir

        !sh
        $ PATH=~/bin:$PATH
        export PATH

*   **Dikkat!**  `export` komutunda değişken referansı yok, `$` kullanmayın

*   Ortam değişkenlerini yaygın pratikte hepsi büyük harf olarak yazıyoruz

---

##  Özel Ortam Değişkenleri

*   `$PATH` malum; şunlara göz atın: `$PWD`, `$HOME`, `$USER`

*   `$?` → Son komutun ürettiği çıkış kodu

        !sh
        $ cc -o echo echo.c
        $ echo $?
        0

*   `$!` → Son komutun ürettiği prosesin numarası (sizde örnektekinden farklı
    bir değer görüntülenecektir)

        !sh
        $ cc -o echo echo.c
        $ echo $!
        19

---

##  Yerleşik Komutlar

*   Şu ana kadar göz ardı ettiğimiz gerçek: `cd`, `pwd` ve `echo` aslında
    yerleşik kabuk komutları

*   Yerleşik komutlar hakkında yardım almak için `help` komutunu (bir başka
    yerleşik komut) kullanabilirsiniz

        !sh
        $ help cd

*   Uyumluluk amacıyla bu komutlardan bazılarının öntanımlı `PATH`'te kurulu
    sürümleri de bulunur

        !sh
        $ which pwd
        /bin/pwd

---

##  Yerleşik Komutlar

*   Yerleşik komutlar çok daha hızlı çalışır, neden?

*   Bu komutlar çalıştırıldığında proses oluşturma/anahtarlama maliyeti yoktur

*   Fakat yerleşik komutların varlığı sadece "yüksek performans" ile açıklanamaz

*   Örneğin `cd` komutu yerleşik olmak zorundadır

---

##  Görev

.fx: task

*   `cd` komutu neden yerleşik bir komut olmak zorundadır?

---

#   Sahiplik ve İzinler

---

##  Sahiplik ve İzinler

Üç tip sahiplik ve üç tip eylemle kurulabilecek pek çok kombinasyon var: "Sahibi
okuyabilir/yazabilir, grup okuyabilir, başkaları hiç bir şey yapamaz" gibi.

1.   Bu kombinasyonları nasıl temsil edeceğiz?

2.   Etkin kombinasyonu nerede saklayacağız?

3.   Kombinasyonların yönetimi (görüntülenmesi ve düzenlenmesi) nasıl?

Son iki soruyu kısmen cevaplamıştık

---

##  `root`

        !sh
        $ sudo id
        uid=0(root) gid=0(root) gruplar=0(root)

*   Sistem yöneticisinin kullanıcı no'su `0`, kullanıcı adı `root`

*   Aynı kimlikte bir `root` grubu da mevcut; diğer "öz grup"larda olduğu gibi
    bu gruba sadece `root` kullanıcısı üyedir ve öyle de bırakılmalıdır

*   Böyle bir hesap düzenlemesi her UNIX sisteminde daima mevcuttur

*   Fakat bazı UNIX sistemlerinde (ör. Ubuntu ve türevleri) `root` hesabıyla
    oturum açamazsınız

*   Kullandığınız dağıtımda gerçek bir `root` hesabı varsa (ör. Debian) **`sudo`
    komutunu çalıştırdığınızda istenen parola `root` parolası değil normal
    kullanıcı hesabınıza ait paroladır**

---

##  Sahiplik ve İzinler

Etkin kombinasyonu nerede saklıyoruz? → `inode`

*   Dosya durum bilgileriyle birlikte sahiplik ve izin bilgileri de kayıtlı

Nasıl görüntülüyoruz?

        !sh
        $ ls foo.txt
        -rw-r--r-- 1 roktas staff 0 Eki  2 01:27 foo.txt

*   `3`'lü öbekler halinde `9` karakterli bir dizgiyle

*   İlk öbek kullanıcı, ikinci öbek grup, son öbek başkaları

*   Her öbekte `rwx`'ten hangisine izin verilmişse o karakter, izin yoksa `-`

---

##  Dizin İzinleri

İzinleri oku/yaz/çalıştır olarak sınıfladık

*   Bu güzel bir model, fakat adı geçen eylemler dizinler için muğlak kalıyor

*   Çalıştırılabilir dizini "içine girilebilir ve listelenebilir" olarak
    yorumlamak zorunda kalmıştık

*   "Sızdıran Soyutlama" ("Leaky Abstraction")

*   "Okunabilir/yazılabilir dizin"de de bazı muğlak noktalar var

*   Bu noktada dosya/dizin birlikteliğinden bir parça taviz vereceğiz

*   Dizin izinleri için standartlara bağlanan semantik bir çatı gerekiyor

---

##  POSIX

POSIX → Portable Operating System Interface

*   Resmi olarak IEEE (Elektrik ve Elektronik Mühendisleri Enstitüsü) tarafından
    yönetiliyor

*   UNIX geleneğini kodifiye eden bir standart; fakat UNIX ile sınırlı değil

*   İlgi alanı → Sistem çağrıları, kabuk ve çeşitli araçlar; bunların arayüzleri

*   POSIX standartlarına uygun şekilde geliştirilen bir yazılım farklı işletim
    sistemlerine kolayca taşınabiliyor

---

##  POSIX

*   Yazılımların nasıl davranmaları gerektiği çoğu durumda açık olabilir

*   Örneğin: okuma izni → `read`, yazma izni → `write`, çalıştırma izni → `exec`
    sistem çağrıları içeren komutlarda devreye girer

*   Fakat belirsiz veya uç durumlar var; bu noktada POSIX devrede

*   "Neden böyle davranıyor?" sorusuna evvel emirde verilecek cevap: "POSIX
    böyle buyurmuş"

---

##  Dizin: Okunabilir

*   Okunabilir dizin → Listelenebilir dizin

*   Okunabilir olmasa bile varlığını bildiğiniz bir dosya hakkında bilgi
    alabilirsiniz!

        !sh
        $ ls -l okunabilir_olmayan_dizin/varolan_dosya

*   Koşul → Dizin çalıştırılabilir olmalı

Web servislerinde kullanılan indekslenebilir dizin fikriyle benzer

*   `http://foo.com/bar/` dizinindeki dosyalar listelenemeyebilir

*   Fakat `baz.txt` dosyasının o dizinde bulunduğunu biliyorum

*   `http://foo.com/bar/baz.txt` ile dosyayı görüntüleyebilirim

---

##  Dizin: Yazılabilir

*   Yazılabilir dizin → Dizinde yeni bir dosya/dizin oluşturabilirsiniz

*   Yazılabilir olmasa bile dizinde varolan bir dosyaya yazabilirsiniz

        !sh
        $ echo ekleme >yazılabilir_olmayan_dizin/varolan_dosya

*   Koşul → Dizin aynı zamanda çalıştırılabilir olmalı

---

##  Dizin: Çalıştırılabilir

.fx: achtung

*   Çalıştırılabilir dizin → Dizini yönetebilirsiniz; arama ve dosya bazında
    (içerik değil) düzenleme yapabilirsiniz

*   En basit yönetimsel etkinlik: dizine girebilirsiniz → `cd`

*   Dizindeki dosyalar hakkında ayrıntılı bilgi alabilirsiniz → `ls -l`, `stat`

*   Dizinde "invazif" eylemler gerçekleştirebilirsiniz: kopyala → `cp`, taşı →
    `mv`, sil → `rm`, bağla → `ln`

*   Bu "invazif" eylemler için dizin aynı zamanda yazılabilir olmalı

---

##  Dizin: Çalıştırılabilir

Bazı durumlarda uygulanabilecek diğer bir kural:

*   Program bir şekilde dosyanın `inode`'daki bilgilere ihtiyaç duyuyorsa,
    dosyanın bulunduğu dizin çalıştırılabilir olmalıdır

*   Örneğin `ls -l`, ve `stat` bunu çok açık şekilde yapıyor

---

##  Görev

.fx: task

*   `cp`, `mv`, `rm`, `ln` komutları `inode`'da bulunan bilgileri kullanır mı?
    "Evet" ise neden ve hangi bilgiler?

*   Size ait olmayan bir dosyayı silebilir misiniz?  "Evet" ise hangi
    koşullarda?

*   Salt okunur olarak ayarlı bir dosya silinebilir veya ismi değiştirilebilir mi?

*   Aşağıdaki komut satırı sonuçlarını yorumlayın

        !sh
        $ cd /tmp
        $ mkdir t
        $ echo foo >t/foo
        $ chmod -x t
        $ ls t
        ls: t/foo'e erişilemedi: Erişim engellendi
        foo
        $ /bin/ls t
        foo

---

##  Temsil

Sahiplik/izin kombinasyonlarını nasıl temsil edeceğiz?

*   Görüntüleme (`ls`) ve değiştirme (`chmod`) araçlarında kullanıcı tarafındaki
    temsil sorusu cevaplandı gibi

*   Ama programatik olarak bu temsilin nasıl yapılacağı sorusu hala açıkta

*   Sahiplik/izin bilgisi `inode`'da nasıl temsil edilecek?

Cevap beklenildiği gibi: **sayılar**

*   Kullanıcı ve gruplar zaten birer tamsayı → `uid`, `gid`

*   İzin?  `3` bitlik bir bit deseni?

---

##  Sekizli Temsil

*   Menemonikler

        !sh
        0: ---   1: --x   2: -w-   3: -wx
        4: r--   5: r-x   6: rw-   7: rwx

*   Bit desenleri

        !sh
        0: 000   1: 001   2: 010   3: 011
        4: 100   5: 101   6: 110   7: 111

*   Kısıtlayarak başla → `---` → `000` → `0`

*   **Çalıştır**: en anlamsız bit açık (`1`) olmalı → `001` yani `1` ekle

*   **Yaz**: ikinci bit açık olmalı → `010` yani `2` ekle

*   **Oku**: için en anlamlı bit açık olmalı → `100` yani `4` ekle

---

##  Sekizli Temsil

Artık elimizde düzgün bir temsil şeması var: Sekizli (Oktal) sayılar

*   Bu şema gerçeklemede kullanılabilir

        !c
        struct inode {
                ...
                umode_t i_mode; /* 40 2 */
                ...
        };

*   `inode` yapısına uzun bir bit dizisi ("blob") gibi bakabilirsiniz

*   Bu dizide 40'ncı bitten itibaren 3 bit izinlere ayrılmış

---

##  `chmod`

Sekizli temsil o kadar basit ki izin yönetimi araçlarında da kullanılabilir

*   "okuma ve yazma" hakkı var → `4 + 2` → `6` gibi

*   Örnek sadece ben okuyup/yazabileyim

        !sh
        $ chmod 400 foo.txt

*   Tüm izinleri ver

        !sh
        $ chmod 777 foo.txt

*   Karışık mı?  Sorun değil "mnemonik"li komutları kullanın

*   Ama bu gösterimi bilmenizin yararlı olacağı önemli bir özellik var: `umask`
    → dosya oluşturma maskesi

---

##  `umask`

Yeni bir dosya oluşturulduğunda izinleri kim belirliyor?

*   Dosya oluşturulduğunda `ls -l` ile gördüğümüz izinlere kim karar veriyor?

Dosya oluşturma genel olarak ilgili programda yapılan bir `open` sistem
çağrısıyla gerçekleşir

*   Dolayısıyla bu izinlere programı geliştirenler karar veriyor

*   Örneğin program bir dizin oluşturuyorsa en azından dizin sahibi için
    çalıştırılabilir olması beklenir

*   Veya `cc` derleyicisinin ürettiği program dosyasını çalıştırılabilir izinle
    oluşturması güzel bir konfordur

Bu süreç üzerinde bizim bir denetimimiz var mı?

*   Evet var, `umask` sayesinde

---

##  `umask`

*   Programcı dosyayı oluştururken uygun gördüğü bir izin kombinasyonu kullanır

*   Olağan senaryolarda öntanımlı izinler tipik olarak dosyalar için `0666`,
    dizinler için `0777`

*   Yani `0666` → "herkes yazsın/okusun, fakat bu çalıştırılabilir bir dosya
    değil", `0777` → "herkes yazsın/okusun ve bu dizine girebilsin"

*   Proses bu izinle dosya/dizin oluştururken ebeveyn prosesten miras aldığı
    `umask` değerini kullanır

*   Örneğin pek çok sistemde öntanımlı olarak gelen `0022` maskesi için `0666 -
    0022 = 0644` ve `0777 - 0022 = 0755` izinleriyle dosya/dizin oluşturulur

*   Yani `0644` → "herkes okur/yazar, fakat sadece kullanıcı yazma hakkına
    sahip", `0755` → "herkes okuyabilir ve çalıştırabilir, fakat sadece
    kullanıcı yazabilir"

*   Görüldüğü gibi `umask` bir negatif maske olarak vazife görüyor

---

##  `umask`

Maskeyi yerleşik bir kabuk komutu olan `umask` ile ayarlıyoruz

        !sh
        $ umask 002

*   Öntanımlı `0022` maskesi gayet uygun

*   Daha kısıtlayıcı olmak için `0077` değerini kullanmak isteyebilirsiniz

*   Veya daha liberal olmak için `0002`

---

##  Yapışkanlık Özelliği

.

---

##  Dosya Betimleyicileri

.

---

##  `lsof`

.

---

##  `fuser`

.

---


#   Ek: `strace`

---

##  `strace`

*   Bu tür soruların cevaplanması için "oku/yaz/çalıştır" eylemlerinin hangi
    sistem çağrılarıyla somutlaştığını belirlememiz lazım

*   Sistem çağrıları ilk bakışta farkedilmeyebilir

*   Bu noktada yardımcı olabilecek güzel bir araç var → `strace`

*   Örneğin bir dizinin listelenmesinde gerçekleşen sistem çağırılarını görmek
    için

        !sh
        $ strace ls -l

---

##  Tamponlama

Giriş/Çıkış işlem sıklığını azaltmak için kullanılan bir teknik → "Buffering"

*   Giriş/Çıkış aygıtları (belleğe göre) **çok** yavaş

*   DRAM ve sabit disk erişimleri tipik olarak 1000-10000 oranında farklı

*   Aygıttan okurken tek seferde bir değil çok oku

*   Aygıta yazarken tek seferde bir değil çok yaz

Belleğin bir bölümünü (etkin çalışma belleğiyle aygıt arasında) tampon bölge
olarak kullan

*   Aygıtı önce tampona oku

*   Yazarken önce tampona yaz

---

##  Tamponlama/Önbellekleme

*   Her iki terim de benzer şeyleri anlatıyor

*   Tamponlama veya önbellekleme; çok temel bir başarım iyileştirmesi

*   Bilgisayar sistemlerinde tamponlar (önbellekler) pek çok düzeyde **her
    yerde**

*   Hemen hemen her donanım biriminde önbellek var: L1, L2, L3 önbellekler,
    sabit disk önbellekleri vb

*   Pek çok yazılımda bir tür önbellekleme var; önbelleğin bellekte olması bile
    gerekmiyor, ör. tarayıcı önbelleği

*   Tamponlama standart dosya işlemlerindeki "önbellekleme"yi anlatan bir terim

---

### Tamponlama

*   Alt seviye sistem çağrıları, `read`/`write` tamponlanmamış

*   Standart C kitaplığında "`stdio.h`"ta tanımlı işlevler daima tamponlanmış

*   Örneğin `printf`, `getc`, `putc` `scanf` (ve bunların `f`'li versiyonları)

---

##  Tamponlama

*   Kaynak

        !c
        #include <stdio.h>
        #include <unistd.h>

        int
        main(void)
        {
                printf("Önce");
                write(1, "Sonra", 5);
                return 0;
        }

*   Çıktı (ekran)

        !sh
        $ ./a.out
        SonraÖnce
---

### Tamponlama

*   `write` sistem çağrısı tamponlanmamış

*   Dosya betimleyicisi `1` olan aygıta kaynaktan okuduğu `5` baytlık veriyi
    yazıyor

*   Dosya betimleyici `1` → `stdout`

*   5 bayt → "Sonra" dizgisindeki 5 karakter

*   `printf` tamponlanmış

*   `printf` de `stdout` aygıtına yazıyor

*   `a.out` kaynak kod derlendiğinde üretilen öntanımlı program

---

### Tamponlama

Tamponu ne zaman boşaltacağız? (Boşaltma → Flush)

*   Tampon boyutu sınırlı

*   Sınırsız (ve kalıcı) bir bellek aygıtınız olsaydı böyle bir sorun olmazdı

*   Tampon dolduğunda veya süreç sonlandığında boşalt

*   Özel olarak istendiğinde boşalt

*   Tampon içeriğinde özel bir karakter görüldüğünde (dolaylı)

---

##  Tamponlama: Satır

*   Kaynak

        !c
        #include <stdio.h>
        #include <unistd.h>

        int
        main(void)
        {
                printf("Önce\n");
                write(1, "Sonra", 5);
                return 0;
        }

*   Çıktı (ekran)

        !sh
        $ ./a.out
        Önce
        Sonra

---

##  Tamponlama: Satır

Tamponu ne zaman boşaltacağız?

*   Tampon içeriğinde özel bir karakter görüldüğünde (dolaylı)

*   '`\n`' satır sonu karakteri tampon boşaltıyor

*   Satır tamponlanmış ("line buffered") çalışma kipi

*   Çıktı aygıtının `stdout` (dosya betimleyici `1`) olmasına dikkat buyurun!

---

##  Tamponlama: Tam

*   Kaynak

        !c
        #include <stdio.h>
        #include <unistd.h>

        int
        main(void)
        {
                printf("Önce\n");
                write(1, "Sonra", 5);
                return 0;
        }

*   Çıktı (dosya)

        !sh
        $ ./a.out >out
        $ cat out
        Sonra
        Önce

---

### Tamponlama: Tam

Tamponu ne zaman boşaltacağız?

*   Tampon dolduğunda veya süreç sonlandığında boşalt

*   Bu örnekte '`\n`' "boşaltma" anlamını yitirmiş gözüküyor

*   Süreç sonlandığında tampon boşaltılıyor

*   Çıktı aygıtının bir dosyaya (`out`) yönlendirildiğine dikkat buyurun!

*   Çıktı bir dosya olduğunda içeriğin tamamı (veya tampona sığan kısmı)
    tamponlanıyor

*   Tam tamponlanmış ("fully buffered") çalışma kipi

---

##  `fflush`

*   Kaynak

        !c
        #include <stdio.h>
        #include <unistd.h>

        int
        main(void)
        {
                printf("Önce\n");
                fflush(stdout);
                write(1, "Sonra", 5);
                return 0;
        }

*   Çıktı (dosya)

        !sh
        $ ./a.out >out
        $ cat out
        Önce
        Sonra

---

### `fflush`

Tamponu ne zaman boşaltacağız?

*   Özel olarak istendiğinde boşalt

*   `fflush` argüman olarak verilen `FILE *` çıktı akımına ayrılan tamponu
    boşaltıyor

*   Örnekte dosyaya yönlendirme olmasaydı `fflush`'a gerek yoktu (satır
    tamponlu)

**Dikkat!  Girdi akımları da (örneğin `stdin`) tamponlanmıştır, fakat `fflush`
  sadece çıktı akımlarıyla (örneğin `stdout`) çalışır**

---

##  Tamponlama: `stderr`

*   Kaynak

        !c
        #include <stdio.h>
        #include <unistd.h>

        int
        main(void)
        {
                fprintf(stderr, "Önce");
                write(2, "Sonra", 5);
                return 0;
        }

*   Çıktı (ekran)

        !sh
        $ ./a.out
        Önce
        Sonra

---

##  Tamponlamama

*   Çıktı aygıtı `stderr` olduğunda `stdio.h` işlevleri tamponlama yapmıyor

*   Neden?

*   Hata varsa programda veya çalışma ortamında bir sorun var

*   Bunu hemen raporlamak, bekletmemek lazım

*   Aksi halde raporlama fırsatınız hiç olmayabilir

---

##  Tamponlama

.fx: achtung

Standart C kitaplığında

*   `stdout` ve `stdin` bir uçbirim ise satır tamponlu; aksi halde tam tamponlu

*   `stderr` daima tamponsuz

*   Olağan dosyalar tam tamponlu

---

#   İşletim Sistemi

---

##  Kullanıcı/Çekirdek Kipi

*   Çekirdek sistem kaynaklarının (bellek, işlemci) yönetiminde tam yetkili

*   Kullanıcı proseslerinin sistem kaynaklarına erişim yetkisi sınırlı

*   Örneğin çekirdek bellekte herhangi bir hücreyi okuyabilir veya yazabilir

*   Ama kullanıcı prosesleri bu işlemi doğrudan yapamaz, neden?

*   Kullanıcı prosesi bu işlemi yetkili organa, yani işletim sistemine
    yaptırmalı

*   Nasıl?  İşletim sistemine çağrıda bulunarak → Sistem çağrıları

---

##  Kullanıcı/Çekirdek Kipi

*   Kullanıcı proseslerinin sistem kaynaklarına erişim yetkisi sınırlı

*   İşlemci komut kümesi yetki sınırına göre düzenlenmiş → ayrıcalıklı komutlar,
    olağan komutlar

*   Ayrıcalıklı komutlar → çoğunlukla ortak kullanılan sistem kaynaklarına
    doğrudan erişim yapan komutlar; örneğin belleğe yazmak

*   Olağan komutlar → yetki gerektirmeyen olağan komutlar; örneğin toplama
    işlemi

*   Yetki durumu işlemcinin özel bir kipe anahtarlanmasıyla belirleniyor

*   Yetkilendirilmemiş kip → Kullanıcı kipi, Yetkilendirilmiş kip → Çekirdek
    kipi

---

##  Kullanıcı/Çekirdek Kipi

*   İşlemci, kullanıcı prosesini çalıştırırken kullanıcı kipinde → denetim
    kullanıcı prosesinde

*   Anlamlı her iş bir şekilde girdi/çıktı gerektirir

*   Kullanıcı prosesi girdi/çıktı işlemleri için çekirdeğe çağrıda bulunuyor

*   Çağrıyı alan çekirdek işlemciyi yetkilendirilmiş kipe geçiriyor → artık
    denetim çekirdekte

*   Çekirdek isteği yerine getirdikten sonra işlemciyi tekrar kullanıcı kipine
    geçiriyor → denetim tekrar kullanıcı prosesinde

---

##  Sistem Çağrıları

Kullanıcı prosesleri sistem kaynaklarına erişirken sistem çağrıları yoluyla
çekirdeğe istekte bulunuyor.  Neden?

*   Sistem kaynakları prosesler tarafından ortak kullanılıyor

*   Sınırlı kaynakların kullanımı da denetime bağlı olmalı

*   Ayrıca...

*   Erişmek yeterli değil ilgili kaynak üzerinde neyi nasıl yapacağınızı da
    bilmelisiniz

*   Bu "nasıl" bilgisini kullanıcı uygulamalarında değil çekirdekte tutuyoruz

*   Sistem çağrıları "nasıl" bilgisinin üst düzey bir arayüzde yapılan
    tanımlarından ibaret

*   Sistem çağrılarının arka planında aygıt sürücülerinin baş rolü oynadığı
    katmanlar var

---

##  Sistem Çağrıları

*   Sistem çağrıları kullanıcı kipinde başlayıp çekirdek kipine geçişle devam
    eden ve kullanıcı kipine geçişle sonlanan bir işlev çağrısı


---

##  İşletim Sistemi

*   Kısa aralıklarla (ör. 10 ms) çalışan bir sistem saati

*   Her saat darbesinde denetim işletim sistemine geçiyor

*   İşletim kararları

----


<!--

*   unix'te sayılar, kullanıcılar → uid, proses → pid, dosyalar → inode
*   dizin entry'de her isim-inode çifti bir link oluşturur, ls çıktısında görülen
*   dosyalarda 255 karakter değil bayt sınırlaması
*   FAT'te 8 +3.  noktaya özel muamemele, kötü tasarım
*   programlanmamış istisnalar: fault trap abort
*   trap aslında programlanmamış bir exception
*   exceptionlarda func call'dan farklı olarak işlemci state değiştirir
*   intel bunlara gate diyor
*   fault → işlemi tekrarla
*   abort → çık
*   trap → işleme bununla devam et
*   kesmeler → istisna değil, dış kaynaklardan asenkron geliyor
*   çekirdekte kesme vektörü tablosu, trap n, n indisiyle fonksiyonu bul
*   eskiden int x80/iret kullanılıyor, artık syscall/sysexit
*   ring 0 priveleged mode, ring 3 user mode
*   syscall maliyetli, çünkü ring değişimi yapılıyor ve context kaydediliyor
*   user/kernel tradeoff, güvenli+kararlı/hızlı+yetenekli
*   windows task manager penceresi, kırmızı kernel, yeşil user; aradaki fark
*   sürücülerin bir kısmı user'da bir kısmı kernel'da; tradeoff'a dikkat


https://www.youtube.com/user/briantwill

-->
