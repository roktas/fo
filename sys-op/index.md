#   Sistem - Operatör

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

http://roktas.me/

Ekim 2012

---

##  Kabuk

*   Sisteme girdiğinizde sizi karşılayan ortam; siyah ekran!

*   İşletim sistemiyle (adeta) "chat" yapıyorsunuz

*   Bu nasıl bir ortam, nasıl bir sistem?

*   Sekreter Lale hanımı her sistem açılışından sonra mutad olduğu üzre
    karşılayan Feysbuk ortamından bahsetmiyoruz!

*   Örneğin bir veri merkezinde ("data center") yönetiminden sorumlu olduğunuz
    bir sunucu

*   Örneğin kodlama yaptığınız bir iş istasyonu

---

##  Kabuk

        !sh
        $ whoami
        roktas

*   `$` → "Komut girebilirsin" sembolü ("Command Prompt")

*   Kabuk tarafından görüntüleniyor

*   Farklı biçimlerde farklı bilgiler içerecek şekilde ayarlanabilir

*   Dokümantasyonda geleneksel olarak `$` + boşluk şeklinde gösteriyoruz

*   `whoami` → komut; `roktas` → komut çıktısı

*   Bu dokümandaki komutları denerken, komutun `$`'dan sonraki kısım olduğunu
    unutmayın!

---

##  `whoami`

        !sh
        $ whoami
        roktas

`whoami` "Ben Kimim?"

*   UNIX sistemlerde her kullanıcının bir adı var

*   Kullanıcı adı ("username") geleneksel olarak hepsi küçük harf (noktalama
    işareti veya rakam yok) ve Türkçe karakter içermiyor

*   Sistemi grafik arayüzle kullandığınız masaüstü ortamların giriş ekranlarında
    "kullanıcı dostu" olmak adına ad soyadınız da görüntülenebilir

*   Fakat kullanıcı adı size ait önemli bir öge

---

##  Kullanıcı Adı

.fx: achtung

Kullanıcı adınızı özenle seçin ve meslek hayatınız boyunca da tutarlı olarak her
ortamda kullanın

*   **Sadece `a-z` aralığında; hepsi küçük harf, Türkçe karakter (maalesef)
    yok**

*   Kullanıcı adının fazla uzun olmamasında yarar var; bu adı meslek hayatınız
    boyunca kaç kere tuşlayacağınızı düşünün!

*   Eposta adresi başta gelmek üzere kullandığınız her serviste kullanıcı adı
    aynı olsun

*   Bu düzenlemenin programatik bir değeri var; değişiklik günceleri, telif
    hakkı metinleri başta olmak üzere pek çok yerde bu adı kullanacaksınız

*   Fakat İnternet kullanımının olağanüstü yaygınlaştığı günümüzde geçerli
    biçimde (`a-z`), kısa ve tekil bir isim bulmak kolay olmayabilir

*   Bu koşullara uygun bir ad bulmak için hayalgücünüzü kullanın

---

##  `passwd`

*   Parolanızı nasıl değiştireceksiniz?

*   Hemen başlangıçta öğrenilmesi gereken ilk işlem

        !sh
        $ passwd

---

##  Parola Seçimi

.fx: achtung

        Qwerty

---

##  `lspci`

        !sh
        $ lspci
        ...
        00:02.0 VGA compatible controller: Intel ...
        00:1b.0 Audio device: Intel ...
        ...
        02:00.0 Ethernet controller: Atheros ...

`lspci` → List PCI

*   İşletim sistemiyle (adeta) "chat" yapıyoruz

*   İşletim sistemine soralım: "PCI veriyoluna bağlı bileşenler neler?"

*   PCI veriyoluna bağlı bileşenler; örneğin ses yongası, ağ bağdaştırıcısı,
    ekran bağdaştırıcısı

*   Bu bilgileri bir grafik arayüz üzerinden de öğrenebilirsiniz

---

##  Uçbirim

*   Tipik bir UNIX iş istasyonunda (güçlü bir masaüstü sistem) grafik ortam
    (GUI) her zaman erişilir durumda

*   Sisteme muhtemelen böyle bir grafik ortam üzerinden (GNOME → GDM),
    kimliğinizi doğrulatarak girdiniz

*   Sonra bir uçbirim ("terminal") açıyorsunuz

*   İşletim sistemiyle etkileşime girmenin tek yolu grafik ortam değil

---

##  Uçbirim

Neden uçbirim?

*   Uçbirim dediğimizde bir klavye/ekran çiftini anlıyoruz

*   Bu ikili geçmişte tek bir ünite halinde bir veri kablosu üzerinden (işlemci,
    bellek ve depolama aygıtlarını barındıran) ana bilgisayara bağlanıyordu

*   Ana makine → veri kablosu (seri iletişim) → kablo bir klavye/ekran
    ünitesiyle sonlandırılıyor

*   Sonlandırma → Termination; yani Terminal → Uçbirim

Günümüzde böyle bir düzenleme yok

*   Ana makine, klavye, ekran tek bir ünitede

*   Böyle bir terminal ünitesi yok ama o eski düzene öykünen yazılımlar var →
    Terminal Emulators

---

##  Konsol

*   Uçbirim veya Uçbirim Emulatörü adlandırması kablo sonlandırması yönüyle
    anlam kazanıyor

*   Uçbirimin çalışma ortamında daha dekoratif durmasını sağlayabilirsiniz

*   Bir konsol gibi...

*   Konsol uçbirimle aynı şeyi anlatıyor, tek farkla "mobilya bakış açısı"

---

##  `echo`

        !sh
        $ echo Merhaba Dünya
        Merhaba Dünya

*   En basit komutlardan biri

*   Komut satırı argümanlarını görüntülüyor

---

##  Kabuk

*   Sadece komut girilen bir "çalıştırıcı" ("launcher") değil

        !sh
        $ echo Merhaba $USER
        Merhaba roktas

*   Örneğin bir değişken kullandık: `$USER`

*   Değişken referansları `$` ile başlıyor

*   Değişkenin adı → `USER`, içeriği → `$USER`

*   Kabukta bundan da fazlası var gibi

---

##  İpuçları

.fx: achtung

Komut satırında çalışmak herşeyi yazmak anlamına gelmiyor; aşağıdaki basit
kısayolları kullanabilirsiniz

*   Önceden girdiğiniz bir komutu tekrar yazmanız gerekmiyor; aşağı/yukarı ok
    tuşlarıyla komut satırı tarihçesinde dolaşabilirsiniz

*   Bir komutun adını veya komuta verilen argümanları (örneğin dosya isimleri)
    sonuna kadar yazmanız gerekmiyor; sekme ("tab") tuşunu kullanarak otomatik
    tamamlama yapabilirsiniz

*   Geçmiş bir komuta ulaşmak için komut tarihçesinde baştan sona dolaşmanız
    gerekmiyor; `ctrl-r` tuşuna basın ve komutun hatırladığınız bir bölümünü
    (örneğin ilk harfini) yazmaya başlayın

*   Kopyalama için fareyle metni seçin ve imleci uygun yere konumladıktan sonra
    farenin orta tuşuna (veya kaydırma tekerleğine) basın

*   Bir komutun çıktısını (örneğin yardım almak amacıyla) bir dosyaya kaydetmeyi
    tercih edin; nasıl?

        !sh
        $ KOMUT >dosya 2>&1

---

##  Kabuk Programlama

**Kabuk bir programlama ortamı!**

        #!sh
        $ if [ $USER = roktas ]
        > then
        >       you="dostum"
        > else
        >       you="yabancı"
        > fi
        > echo Merhaba $you
        Merhaba dostum

*   Komutlar tek satıra sığmadığında komut istemi değişiyor; `>` →  "devamı"

*   Fakat dikkat sözdiziminde boşluk özgürlüğü yok!

*   Atama yaparken (satır 3 ve 5) `=` etrafında boşluk **olmamalı**

*   `[`'dan sonra ve `]`'dan önce en az bir boşluk **olmalı**

---

##  Neredeyim?

        !sh
        $ pwd
        /home/roktas

*   `pwd` → "Print Working Directory"

*   Bulunduğunuz dizini görüntüler; bulunduğunuz dizin → çalışma dizini

*   Sisteme giriş yaptığınızda (özel bir yapılandırma kullanmadığınız sürece)
    daima "ev dizini" içindesiniz

---

##  Çalışma Dizini

Çalışma dizini temel bir kavram

*   Örneğin göreceli dosya yolları çalışma dizinine göre çözülür

*   Yaptığınız bazı işlemler (okuma/yazma) çalışma dizininde size tanınan
    haklarla sınırlı

*   Oturum süresince çalışma dizinin görünür durumda olmasında yarar var

*   Bunu nasıl sağlarız?  Komut istemi "farklı biçimlerde farklı bilgiler
    içerecek şekilde ayarlanabilir"

*   Bu ayar yapıldığında örneğin `/tmp` dizinindeyseniz komut istemi şuna benzer
    görünür

        !sh
        /tmp$

*   Dokümanda, çalışma dizininin bilinmesini gerektiren örneklerde böyle bir
    komut istemi kullanacağız

---

##  Dizinler ve Dosyalar

.

---

##  Dizin ve Dosya

*   Dizin ("Directory"): GUI ortamlarda klasör ("folder") olarak biliniyor

*   UNIX sistemlerde dosya ve dizin mümkün olduğunca benzer bir semantik
    gösterir

*   Aslolan dosyadır

*   Dizinlere de birer dosya gibi muamele edilir

*   Bir dizini, içindeki dosyalarla ilgili bilgileri (dosya isimleri, erişim
    zamanları vs) tutan bir dosya gibi düşünebilirsiniz

*   Aksi belirtilmediği sürece dosyalar için belirtilen özellikler dizinler için
    de geçerli

---

##  Dosya Yolu

*   `/` kök dizin altında bir ağaç yapısı

*   `/` ile ayrılmış dizin/dosya isimleri → `/home/roktas`

*   Bu bir `PATH` tanımlar: dosya yolu, patika

*   "mutlak/göreceli dosya yolu" → `/` ile başlayan/başlamayan dosya yolu

*   Göreceli dosya yolunda başlangıç noktası çalışma dizini

---

##  `cd`

`cd` → "Change Directory" - "Dizin Değiştir"

*   Dosya sisteminde gezinmek için birincil araç

        !sh
        /home/roktas$ cd .config
        /home/roktas/.config$ cd -
        /home/roktas$

*   Teknik olarak "çalışma dizini"ni argümanla bildirilen dizin olarak ayarlıyor

*   Göreceli dosya yolları çalışma dizinine göre çözülüyor

        !sh
        /home/roktas$ cd tmp
        bash: cd: tmp: Böyle bir dosya ya da dizin yok
        /home/roktas$ cd /tmp
        /tmp$

---

##  Özel Dizin İsimleri

Bazı dizin isimleri özel

*   `.` → bulunduğunuz dizin

        !sh
        /home/roktas$ cd .
        /home/roktas$

*   `..` → üst dizin

        !sh
        /home/roktas$ cd ..
        /home$

*   Bu isimler kabuktan bağımsız, çekirdek tarafından oluşturuluyor ve her
    düzeyde anlamlı

---

##  Özel Dizin İsimleri

*   `~` → ev dizini

        !sh
        /home$ cd ~
        /home/roktas$

*   Argüman vermediğinizde öntanımlı argüman `~`

        !sh
        /home/roktas$ cd /tmp
        /tmp$ cd
        /home/roktas$

*   `~` kabuk tarafından dönüştürülüyor → tilde dönüşümü ("tilde expansion")

*   Program (örnekte `cd`) `~`'nin varlığından haberdar değil, dönüşüm program
    çalışmadan önce gerçekleşiyor

*   Kabuk tarafından çalıştırılmayan bazı programlarda `~` tanınmayabilir

---

##  Dosya İsimleri

*   `/` dosya yolu ayırıcısı olarak kullanılıyor

*   (`/` ayırıcısı dışında) ASCII `NUL` karakteri yasak; diğer her karakter
    "teknik olarak" serbest (boşluk dahil)

*   Dosya yolu için maksimum uzunluk tipik olarak 255 karakter

*   Fakat "doğru pratikler"e uymanızda yarar var

*   Özellikle geliştirme yaparken

---

##  Dosya İsimleri

.fx: achtung

*   Kodlamada değişken isimlerini seçerken gösterdiğiniz özeni (yoksa böyle bir
    özeniniz yok mu?) dosya isimlendirmelerinde de gösterin

*   Veya e-posta iletilerinde konu alanını yazarken gösterdiğiniz özene benzer
    bir özen

*   İçeriği en kısa ve anlamlı şekilde yansıtan bir isim seçin (idealde dosya
    içeriğini görüntülemek zorunda kalınmamalı)

*   Boşluk karakterleri kullanmayın

*   Türkçe karakterler kullanmayın

*   Kelimeleri `-` veya `_` ile ayırın (ilki daha yaygın)

*   Özel anlamı olan bazı dosya/dizinler dışında büyük harf kullanmayın; dosya
    ismi küçük harflerden oluşmalı

*   Kod dosyaları için önerilen bu kısıtlamaları ofis dosyalarında
    gevşetebilirsiniz (örneğin Türkçe karakterler kullanılabilir)

---

##  `ls`

`ls` "List Directory Contents" → Dizin içeriğini listele

        !sh
        ~$ ls /tmp
        ...

*   Argüman verilmediğinde çalışma dizini `.`

        !sh
        ~$ ls
        bin etc lib

*   Fakat bu haliyle ayrıntı vermiyor sadece dosya/dizin isimleri

*   Görüntülenen ismin dizin mi, dosya mı olduğunu bile öğrenemiyoruz!

---

##  Bir Komutun Anatomisi

*   Daha uzun ("long") bilgi görüntüle → `-l`

        !sh
        ~$ ls -l ~
        drwxr-xr-x 2 roktas roktas 4096 Ağu 12 00:37 bin
        ...

*   Şimdilik program çıktısı üzerinde durmayalım; komutun yapısını inceleyin

*   Program → `ls`, program argümanları → `-l`, `~` (argüman vektörü)

*   Komut satırı seçenekleri ("options") → `-l`

*   Seçenekler genellikle `-<KARAKTER>` biçiminde

*   Yaygın kullanımda argüman denildiğinde seçenek dışındaki ögeler kastediliyor
    → `~`

*   Seçeneğin bir diğer adı "anahtar" → `l` anahtarı

---

##  Bir Komutun Anatomisi

*   Genel biçim

        !sh
        $ <PROGRAM> [<SEÇENEKLER>...] [<ARGÜMANLAR>...]

*   Yaygın notasyonda `[]` ilgili ögelerin isteğe bağlı olduğunu, `...` ise
    ögelerin bir veya daha fazla sayıda tekrar ettiğini anlatır

*   `[]` yoksa ilgili ögenin varlığı gerekli

---

##  Seçenekler

*   GUI uygulamalarındaki "Tercihler"in ("Preferences" veya "Setup") komut
    satırındaki karşılığı

*   Programın davranışını kontrol etmeye yarıyor

*   Genellikle tek harf ("short options")

*   Standartlara uygunluk endişesiyle seçenekleri (varsa) argümanlardan önce
    yazıyoruz

*   Fakat bazı programlarda (özellikle GNU araç seti) yeri önemli değil

*   Yine standart dışı bir ekleme olarak pek çok program iki tireyle başlayan
    kelimelerden oluşan uzun seçenekleri de kabul ediliyor ("long options")

        !sh
        $ ls --all ~
        $ ls --ignore-backups ~

---

##  `man`

        !sh
        $ man ls

`man` → "Manual" - "Kılavuz"

*   `ls` ile ilgili seçenek bilgilerini nereden öğreniyoruz?

*   Kılavuz → Kullandığınız sistemin otoriter bilgi kaynağı

*   Kılavuz hakkında yine kendisinden yardım alalım

        !sh
        $ man man

---

##  `man`

*   Seçenek sayısı fazla olan komutlar için zorunlu; ör. `ls`

*   Çıktısı basit olmayan komutlar için de yararlı; ör. `ls`

*   Sık kullanılan komut ve seçenekler akılda kalabilir

*   Fakat tüm seçeneklerini bildiğiniz komutlarda bile bazen uç durumlardaki
    davranışı kestiremeyebilirsiniz

*   Bu komuta elinizi alıştırın

*   İngilizceniz çok iyi olmasa bile sorununuzu çözebilecek örnek komutlar veya
    basit açıklamalar bulabilirsiniz

---

##  BSD Kılavuz Sayfaları

.fx: achtung

*   Linux kılavuz sayfalarında kalite bazen çok düşüyor

*   BSD sistemlerinin, özellikle OpenBSD'nin, kılavuz sayfaları son derece
    özenli ve doyurucu

*   Bu sayfalardan yararlanmak için BSD kurmanız gerekmiyor (ama öneririz);
    Web'den okuyabilirsiniz

*   http://www.openbsd.org/cgi-bin/man.cgi

*   UNIX sistemler arasında taşınabilir programlar yazmanız için de çok yararlı

*   BSD ile Linux arasındaki farklılıklara dikkat edin!  Bazı komutlar Linux'ta
    farklı davranabilir

---

##  `ls`

        !sh
        ~$ ls -l
        drwxr-xr-x 2 roktas roktas 4096 Ağu 12 00:37 bin
        ...

*   `d` → dosya türü: bu bir dizin

*   `rwxr-xr-x` → izinler: sahibi okur/yazar/çalıştırır, grup ve diğerleri
    okur/çalıştırır

*   `2` → referans sayısı: diğer dosya sistemi nesneleri tarafından bu nesneye
    verilen referansların sayısı

*   `roktas` → sahip

*   `roktas` → grup

*   `4096` → boyut: Bayt cinsinden

*   `Ağu 12 00:37` → son değişiklik zamanı

*   `bin` → isim

---

##  `ls`

*   Sadece dizin ("directory") hakkında bilgi → `-d`

        !sh
        ~$ ls -ld
        drwx------ 49 roktas roktas 4096 Eki  3 21:34 .

*   Çıktıda bazı dosya/dizinler gizlenir; hepsini ("all") gör → `-a`

        !sh
        ~$ ls -a
        .bashrc
        ...
        .private

*   Hangi dosyalar gizleniyor?

---

##  Gizli Dosyalar

*   UNIX sistemlerde dosyaları "gizleyen" bir mekanizma yok fakat bir
    konvansiyon var

*   `.` ile başlayan dosyalar pek çok program tarafından öntanımlı kullanımda
    işleme alınmaz → "nokta dosyalar" ("dotfiles")

        !sh
        $ ls ~

*   Örneğin ev dizininizde bulunan yapılandırma dosyaları, geçici dosyalar,
    önbellekleme veya yedekleme amaçlı kullanılan dosyalar

*   Örneğin sürüm takip sistemlerinin meta dizinleri (`.git`, `.svn`)

*   **Bu konvansiyonda amaç mahremiyet değil (dosya izinlerinin konusu),
    kullanım konforu ("sadece gerekli olanları göster")**

*   Konvansiyonla işleme alınmayan bu dosyaların dikkate alınması için programa
    özel bir seçenek girmeniz gerekebilir

        !sh
        $ ls -a ~

---

##  `mkdir`

`mkdir` Make Directory → Dizin Oluştur

        !sh
        ~$ mkdir tmp
        ~$ ls -d tmp
        tmp

*   Argüman olarak verilen dizini oluşturur

*   Argüman olarak bir dizin yolu verilmişse yolda son dizin (çocuk) dışındaki
    dizinler (ebeveynler) önceden varolmalı

        !sh
        ~$ mkdir tmp/foo/bar
        mkdir: `tmp/foo/bar' dizini oluşturulamıyor: ...

*   `-p` → önce ebeveyn dizinleri ("parents") yoksa oluştur

        !sh
        ~$ mkdir -p tmp/foo/bar
        ~$ ls -d tmp/foo/bar
        tmp/foo/bar

---

##  `touch`

.

---

##  `rmdir`

.

---

##  `rm`

.

---

##  `cp`

.

---

##  `mv`

.

---

##  `ln`

.

---


##  Sahiplik ve İzinler

        !sh
        $ ls foo.txt
        -rw-r--r-- 1 roktas users 0 Eki  2 01:27 foo.txt

*   Uzun `ls` çıktılarındaki sahiplik ve izin bilgilerine tekrar bakalım

*   9 karakterlik bir dizgi; 3'lü `rwx` öbekleri

*   Her öbekte `rwx` dizgisinde izin verilmeyen eylem için `-`

---

##  Sahiplik ve İzinler

Bir dosya ile sahiplik ilişkimiz nasıl olabilir?

*   Dosya kullanıcıya ait: kullanıcı → **u**ser

*   Gruba ait: grup → **g**roup

*   Başkalarına ait: başkaları → **o**thers

Bir dosya üzerinde hangi eylemler gerçekleştirilebilir?

*   Oku → Read

*   Yaz → Write

*   Çalıştır → eXecute

---

##  Sahiplik ve İzinler

        !sh
        $ ls foo.txt
        -rw-r--r-- 1 roktas users 0 Eki  2 01:27 foo.txt

*   Kullanıcı (`roktas`) okuyabilir/yazabilir, çalıştıramaz

*   Grup (`users`) ve başkaları sadece okuyabilir

*   Görüldüğü gibi bu dosyanın çalıştırılması anlamlı da değil; çünkü bu bir
    veri dosyası

*   Fakat dizinlerde çalıştırılabilirlik izninin bulunduğunu görmüştük

---

##  Çalıştırılabilir Dosya

*   Okuma ve yazma izinlerinin kavranması görece kolay

*   Dosya için çalıştırılabilirlik?  Dosyanın bir program olarak
    çalıştırılabilmesi

*   Çalıştırılabilir bir dosya hemen hemen daima bir program dosyasıdır

*   Bu konuya döneceğiz

---

##  Çalıştırılabilir Dizin

*   "Dosya çalıştırılabilir" anlamlı bir izin; dosyanın bir program dosyası
    olduğunu anlıyoruz

*   "Çalıştırılabilir dizin" anlamlı mı?  Dizin bir program değil ki
    çalıştırılsın

*   "Çalıştırılabilir dizin"i basitçe şöyle yorumlayın: "dizine girebilir → `cd`
    ve içeriğini listeleyebilirim → `ls -l`"

*   Bu yorum olağan senaryolarda gayet yeterli

*   Fakat muğlak kaldığı durumlar da var; ilerleyen bölümlerde...

---

##  `chown`

Sahipliği nasıl düzenliyoruz?

*   Kullanıcıyı değiştir

        !sh
        $ chown roktas foo.txt

*   Kullanıcı ve grubu değiştir

        !sh
        $ chown roktas:staff foo.txt

*   Grubu değiştir

        !sh
        $ chown :staff foo.txt

---

##  `chgrp`

Grubu düzenlemenin bir başka yolu

    !sh
    $ chgrp staff foo.txt

*   `chown` ile hem kullanıcı hem grup düzenlenebiliyor

*   Kognitif yükü azaltmak için tek bir araç: `chown` kullanmak daha doğru

*   Bu nedenle fazla kullanmıyoruz

---

##  `chmod`

İzinleri nasıl düzenliyoruz?

*   Sadece ben okuyup/yazabileyim

        !sh
        $ chmod u=rw foo.txt

*   Gruba yazma hakkı ver

        !sh
        $ chmod g+w foo.txt

*   Başkalarının tüm haklarını kısıtla

        !sh
        $ chmod o= foo.txt

*   Herkese (ben, grubum ve başkaları) çalıştırma hakkı ver

        !sh
        $ chmod +x foo.txt

---

##  `chmod`

*   Sahiplik için `ugoa`, izinler için `rwx` mnemonikleri ve üç basit operatör
    `=+-` kullanılıyor

*   Sol tarafta → sahiplik, ortada → operatör, sağ tarafta → izinler

*   Sol tarafın yokluğu `a` ("all") yani herkes anlamına geliyor

*   `=` ile ilgili sahip alanının **üzerine yazılıyor**

*   `=` bir atama, ekleme/çıkarma değil; sağ taraf boşsa tüm izinler kaldırılır

*   `+/-` ile mevcut düzenlemeye ekleme/çıkarma yapılıyor

---

##  Program

*   UNIX'te program dosyalarının önemli bir kısmı ikili ("binary") biçimde

*   Bunlar derlenmiş dosyalar; içeriğine baktığınızda adeta şifrelenmiş bir
    metin

*   İkili içerik programın kaynak kodu hakkında yeterli bir bilgi vermez (fakat
    özel araçlarla bu içerik bile yorumlanabilir)

*   Bazı program dosyaları ise dinamik bir programlama diliyle; örneğin kabuğun
    kendisiyle veya Perl, Python, Ruby gibi dillerle yazılıyor

*   Bu tür programlara "betik" ("script") diyoruz

*   Betik aynı zamanda kaynak kod; Web sayfalarında yüklenen JavaScript
    betikleri gibi

---

##  Betik

*   Ruby ile yazılmış tek satırlık bir `echo.rb` dosyası

        !ruby
        puts ARGV.join ' '

*   Kabukta kullandığımız `echo`'nun Ruby sürümü

*   Bu betiği nasıl çalıştırırız?

        !sh
        $ ruby echo.rb

---

##  Dosya Uzantıları

*   `echo.rb` dosya uzantısı → `.rb`

*   Uzantının betiğin çalıştırılması bağlamında özel bir anlamı yok!

*   Fakat güzel bir pratik; betiğin Ruby diliyle yazıldığını anlatıyor

*   Bu bir konvansiyon; `rb` uzantısı sadece Ruby ile yazılan kaynak kodlarda
    kullanılmalı"

*   Dosyayı düzenlerken de yararlı; pek çok düzenleyici bu uzantıya bakarak
    ilgili dilin sözdizimi renklendirmesini etkinleştiriyor

---

##  Dosya Uzantıları

.fx: achtung

UNIX sistemlerde dosya uzantısı sadece bir konvansiyondur; dosyanın nasıl
çalıştırılacağıyla ilgili teknik bir zorunluluk değildir

*   Windows® sistemlerde karşılaştırın → `.exe` uzantıları

*   UNIX'te böyle bir zorunluluk yok

---

##  Betik

*   Bu yöntemde `echo.rb`'nin çalıştırılabilir olması gerekiyor mu?  Hayır

        !sh
        $ ls -l echo.rb
        -rw-r--r-- 1 roktas roktas 19 Eki  4 03:32 echo.rb

*   Çalıştırılabilir olması gereken Ruby yorumlayıcısı, betik değil

*   Çalıştırma eylemini gerçekleştiren kişi için okunabilir olması yeterli

*   Madem betik programlar kaynak kod halinde geliyor, programı düzenleyebilir
    de!

*   Tek şartla dosya yazılabilir olmalı

---

##  Betik

Betiği tıpkı olağan bir komut gibi çalıştırmak isterseniz?

*   Örneğin buna bir isim verelim → `papagan`

*   Şöyle istiyoruz

        !sh
        $ papagan Naber
        Naber

---

##  Betik

*   İsmi değiştirmemiz yeterli değil, ama ilk adım

        !sh
        $ mv echo.rb papagan

*   **Zorunlu adım** dosya çalıştırılabilir olmalı

        !sh
        $ chmod +x papagan

*   Bakalım böyle çalışıyor mu?

        !sh
        $ papagan
        bash: papagan: komut yok

---

##  `PATH`

*   Komut satırında girilen programlar belirli dizinlerde aranır ve ilk bulunan
    çalıştırılır

*   Aranacak dizinler `:` ayrılmış bir biçimde `PATH` isimli ortam değişkeninde

        !sh
        $ echo $PATH
        ~/bin:/usr/local/bin:/usr/bin:/bin

*   Bulunduğunuz dizin `PATH`'te tanımlı değildir ve **tanımlı olmamalıdır**,
    neden?

*   `PATH`'te tanımlı olmayan bir programı çalıştırmak için programı açık dosya
    yoluyla yazmalısınız

*   Açık dosya yolu?  Bulunduğumuz dizin → `.`, dosya yolu → `./papagan`

---

##  Betik

*   O halde şöyle çalışmalı?

        !sh
        $ ./papagan
        ./papagan: line 1: puts: komut yok

*   Hayır çalışmadı; hata iletisi kabuktan geliyor gibi

*   Bakın Ruby bu hikayede hala sahneye çıkmadı → `ruby echo.rb` etkisi

*   Sistem kaynak kodun kabukta yazıldığını düşünüyor

*   Sistem yani kabuğun talimat verdiği "program yükleyici"; işletim sisteminin
    bir unsuru

*   Bu makul bir varsayım, hangi yorumlayıcının kullanılacağı bilinmiyorsa kabuk
    dilini varsay

*   Kaynağın Ruby ile yorumlanması gerektiğini "program yükleyici"ye
    anlatmalıyız

---

##  Betik

UNIX sistemlerde bu nasıl yapılıyor

*   Sistem ikili dosyalarla düz metin dosyaları ayırabiliyor

*   Çalıştırılabilir ikili dosyalarda içeriğin ilk baytlarında bir tür imza var

*   Düz metin dosyalarda ise ilk satır özel

---

##  `#!` Shebang

*   Program yükleyici ilk satırı ayrıştırarak dosyanın hangi dille yorumlanması
    gerektiğini belirliyor

*   Betik artık şöyle görünmeli

        !sh
        #!/usr/bin/ruby
        puts ARGV.join ' '

*   **Dikkat!**  Shebang satırında yorumlayıcının mutlak dosya yolunu yazmanız
    gerekiyor; neden?

*   `#` Hash simgesi + `!` simgesi → Hashbang

*   İngilizce "Hash" kelimesini okursanız "She" sesini alacaksınız → Shebang

---

##  `#!` Shebang

*   `!` anlaşılır bir şey; program yükleyiciye bir nida gibi; `#` neden var?

*   `#` karakteri Ruby dahil pek çok betik dilinde açıklama satırlarını
    belirtmek için kullanılır; bu karakterle başlayan satırlar göz ardı ediliyor

*   Bakın bu düzenlemeyle artık önceki çalıştırma yöntemi de geçerliliğini korur

        !sh
        $ ruby papagan

*   `#` olmasaydı bu sefer Ruby (veya bir başka betik dili) ihtimal ki `!` ile
    başlayan satırı yorumlayamayacak ve hata oluşacaktı

---

##  Betik

        !sh
        $ ./papagan Naber
        Naber

*   Evet çalıştı!  Ama baştaki şu `./`'dan kurtulamaz mıyız?  Diğer komutlar
    gibi olmasını istiyoruz

*   Açık dosya yolunu verdik çünkü program sadece `PATH` içinde belirtilen
    dizinlerde aranıyor ve `.` dizini `PATH`'te değil

*    Ve tekrar edelim → **"`.` dizini `PATH`'te olmamalı"**  Neden?

*   Dosyayı PATH'te belirtilen bir dizine koymalıyız

---

##  Betik

        !sh
        $ echo $PATH
        ~/bin:/usr/local/bin:/usr/bin:/bin

*   Bu sistemde seçenekler → `~/bin`, `/usr/local/bin`, `/usr/bin`,  `/bin`

*   Sizde seçenekler böyle olmayabilir

*   İlki dışındaki seçenekler olmaz çünkü bu dizinlere yazma hakkımız yok,
    dosyayı bu dizinlere kopyalayamayız

*   Kullandığınız sistemde yazma hakkına sahip olduğunuz böyle bir `~/bin`
    dizini yoksa?

*   Bu dizini oluşturarak, dizinin **kalıcı şekilde** `PATH`'te listelenmesini
    sağlamalısınız; Nasıl?  Eklere bakın

---

##  Betik

        !sh
        $ echo $PATH
        ~/bin:/usr/local/bin:/usr/bin:/bin

*   `~/bin` dizinine yazma hakkımız var

        !sh
        $ cp papagan ~/bin

*   Ve...

        !sh
        $ papagan Naber
        Naber

---

##  `root`

*   Sistem yöneticisi; sistemde her türlü eylemi yapma gücüne sahip kullanıcı

*   Yani "superuser"

*   Sistem yöneticisi bir rol; yöneticinin gerçekte kim veya kimler olacağına
    sistemi yönetimi karar verir

*   Tipik ev kullanımı senaryosunda kurulumu yapan kişi aynı zamanda sistem
    yöneticisi

*   `sudo` yapılandırması hakkında daha ayrıntılı bilgi için eklere bakın

---

##  `sudo`

*   Sistem yöneticisi olarak atanan gerçek bir kullanıcının bu rolle bir işlem
    yapması için `sudo` ("superuser do") komutu kullanılıyor

        !sh
        $ sudo whoami
        root

*   `sudo` başına yazıldığı komutu sistem yöneticisi rolüyle çalıştırır

*   Tipik ev kullanımı senaryosunda bu komut genellikle sisteme yeni programlar
    yüklemek için kullanılır

*   Örneğin Debian ve türevi sistemlerde

        !sh
        $ sudo apt-get install chromium

---

##  `sudo`

.fx: achtung

**`sudo` komutu iki tarafı keskin bir bıçaktır, kullanırken dikkatli olun,
  sisteme hasar verebilirsiniz!**

---

##  Görev

.fx: task

*   `sudo` ve `su` komutlarının arasında ne farklar vardır

*   Bu farklara göre her iki komut için tipik kullanım senaryoları neler
    olabilir?

---

##  `root`

*   Sistem yöneticisi → "superuser"

*   Aynı kimlikte bir `root` grubu da mevcut; diğer "öz grup"larda olduğu gibi
    bu gruba sadece `root` kullanıcısı üyedir ve öyle de bırakılmalıdır

*   Böyle bir hesap düzenlemesi her UNIX sisteminde daima mevcuttur

*   Fakat bazı UNIX sistemlerinde (ör. Ubuntu ve türevleri) `root` hesabıyla
    oturum açamazsınız

*   Kullandığınız dağıtımda gerçek bir `root` hesabı varsa (ör. Debian) **`sudo`
    komutunu çalıştırdığınızda istenen parola `root` parolası değil normal
    kullanıcı hesabınıza ait paroladır**

---

##  Yönlendirme

*   Bir senaryo: bilgisayarınızda bir sorun var; örneğin ağ bağdaştırıcı
    çalışmıyor

*   İhtimal o ki ağ bağdaştırıcısının sürücüsü yüklenmemiş veya hatalı çalışıyor

*   Doğru sürücüyü bulma prosedürü: bağdaştırıcının marka/modelini öğren →
    İnternette arama yap → benzer sorunla karşılaşanların önerilerini incele

*   Sorunu çözemediniz, artık bir bilene (forum, liste, kişi) yazabilirsiniz

*   Yardım isteyeceğiniz kişilere donanım bilgisini nasıl gönderirsiniz?

*   Kopyala/yapıştır?  Daha kolay bir yolu olmalı

*   Ekranda gördüğünü bir dosyaya kaydet ve yardım iletisine dosya olarak ekle

---

##  Yönlendirme

*   Komut çıktıları ekranda görüntüleniyor

        !sh
        $ lspci
        ...

*   Şimdi çıktıyı ekrana değil bir dosyaya **yönlendirelim**

        !sh
        $ lspci > pci.txt

*   Ekranda görünen tüm bilgiler `pci.txt` dosyasında

        !sh
        $ cat pci.txt
        ...

*   `cat` dosya içeriğini görüntülüyor

---

##  Yönlendirme: `>`

`>` → yönlendirme operatörü

*   Bu özelliği kabuk sunuyor

*   `lspci` programı `>`'ın varlığından bile haberdar değil

*   **Dikkat!  Yönlendirme yapılan dosya zaten varsa üzerine yazıyoruz**

*   Dosya adını dikkatli seçin

---

##  `cat`

`cat` → concatenate → ardarda bitiştir

*   Argüman olarak verilen dosyaları ardarda ekranda görüntülüyor

        !sh
        $ echo foo >/tmp/foo.txt
        $ echo bar >/tmp/bar.txt
        $ cat foo.txt bar.txt
        foo
        bar

*   Tek dosya verilirse bitiştirme sonucu yine tek dosya ve o dosyayı
    görüntülüyor

        !sh
        $ cat /tmp/foo.txt /tmp/bar.txt >/tmp/foobar.txt
        $ cat /tmp/foobar.txt
        foo
        bar

---

##  Yönlendirme: `>>`

`>>` → sonuna ekleyerek yönlendirme operatörü

*   Bakın burada ikinci yönlendirme dosyanın üzerine yazılıyor

        !sh
        $ echo foo >/tmp/foo.txt
        $ echo bar >/tmp/foo.txt
        $ cat foo.txt
        bar

*   Üzerine yazmak yerine sonuna eklemek istiyoruz

        !sh
        $ echo foo >/tmp/foo.txt
        $ echo bar >>/tmp/foo.txt
        foo
        bar

*   Bu bir "ekleme" → `append`; bir açıdan bu da bir "bitiştirme"  → `cat`

*   Aynı işlemi üç farklı dosya kullanarak `cat` ile de yapabildiğimizi
    görmüştük

---

##  `cat`

*   `cat` terimi bir tür bitiştirme yapan işlev ve programların
    isimlendirmesinde kullanılan standart bir son ek; bu semantiği unutmayın

*   Örneğin: `strcat` → iki dizgiyi birleştir, `netcat` → `cat` dosya sistemi
    için, bu ağ için

*   Kabuk programlarında `cat` kullanımı bir antipatern'dir; nadiren gereklidir

*   `cat` kullanılan her yerde daha uygun ve etkili bir alternatif çoğunlukla
    vardır (gelecekte bahsedeğiz)

*   Ama komut satırında bazen yararlı olabilir; özellikle bir aygıtın içerik
    dökümünü ("dump) bir başka aygıta veya dosyaya yönlendirmek için

        !sh
        $ cat mini.iso >/dev/sdb

---

##  Borulama: `|`

`|` → boru ("pipe") operatörü

*   `>` ve `>>` yönlendirme operatörleriyle komut çıktılarını dosyalara
    yönlendiriyoruz

*   Bu operatörlerin sağ tarafında birer dosya adı var

*   Komut çıktısını bir başka komuta yönlendirebilir miyiz?

*   Öyle ki alıcı komut yönlendirdiğimiz komut çıktısını girdi olarak kabul
    etsin

*   Örneğin "foo" dizgisinde kaç bayt var?

        !sh
        $ echo -n foo | wc -c
        3

*   Operatörün sağ tarafında dosya değil bir komut var

*   Örnekte "`foo`" dizgisindeki bayt sayısı hesaplanıyor

---

##  Borulama: `|`

        !sh
        $ echo -n foo | wc -c
        3

*   İki komut arasında veri akışını sağlayan bir tür boru düşünün → "borulama"

*   Dikkatli bakarsanız `|` karakterinin ortasında bir boru deliği göreceksiniz
    (bazı sabit genişlikli yazıtiplerinde bu belirgin olmayabilir)

*   Verinin o delikten aktığını düşünün

*   Borunun sol ucunda `echo`, sağ ucunda `wc`

*   `echo` komutu "`foo`" dizgisini sonda satır sonu olmadan görüntülüyor

*   Fakat çıktı ekranda değil boruda

*   Borunun diğer ucundaki `wc` komutu veriyi alarak işliyor

---

##  Borulama

*   Borulama işlemi kabuk tarafından yönetiliyor

*   Borunun iki ucundaki aktörler bu işlemden habersiz

*   Komutların dikkate aldığı tek şey şu: "veri bir yerden okunur, bir yere
    yazılır"

*   "Bir yer" bir dosya da olabilir, bir boru da olabilir

*   Ama komutların bunu bilmesi gerekmiyor

*   Bu şekilde komutları birleştirerek pek çok iş çevirebilirsiniz!

---

##  `less`

.

---

##  `grep`

`grep` → Global Regular Expression Printer → (basitçesi) İfadeyle eşleşen
satırları görüntüle

*   Argüman olarak verilen ifadeyi (diğer argümanla bildirilen) dosyada veya
    boruda ara

*   "Bu makinede kullanılan ağ bağdaştıcısının (Ethernet) markası ne?"

        !sh
        $ lspci | grep thernet
        02:00.0 Ethernet controller: Atheros Communications Inc...

*   `lspci`'nin veri pompaladığı boruda arama `thernet` terimini aradık

*   Aranan bulunmuşsa terimi içeren satır görüntüleniyor

*   Aramada neden "`ethernet`" demedik?

---

##  Küçük Araçlar Anlayışı

.fx: achtung

UNIX araçları borulama yoluyla birleştirilerek farklı ihtiyaçları
karşılayabilecek şekilde tasarlanmıştır

*   Küçük ama kişilikli araçlar geliştir öyle ki her biri yalnız bir işi yapsın
    ve borulama yoluyla birleştirilebilsin

*   Küçük araçları borulama yoluyla birleştirerek farklı kabiliyetler oluştur

*   Kompozisyonla elde edilen kabiliyet sadece o kabiliyete sahip büyük ve özel
    bir araca olan ihtiyacı ortadan kaldırıyor

*   Tüm araçları bir arada kullanabilmek için (bir tür yapıştırıcı olarak)
    kabuktan yararlan

---

##  `grep`

*   Dosyalarda da arama yapabilirsiniz

        !sh
        $ grep roktas /etc/passwd
        roktas:x:1000:1000:Recai Oktaş,,,:/home/roktas:/bin/bash

*   İlk argüman "ifade", ikinci argüman dosya

*   `grep`'te bundan da fazlası var →  "Global **Regular Expression** Printer"

*   Karmaşık ifadeler tanımlanabiliyor

---

##  Düzenli İfadeler

Regular Expression → Düzenli İfade

.

---

##  Kabuk Desenleri

.

---

##  `find`

`find` → Dizin ağacında dosya ara

*   Argüman olarak verilen dizinde arama yap

*   `grep` dosya içeriğinde; `find` dosya sisteminde arama yapıyor

*   `grep` eşleşen içeriği görüntülüyor; `find` eşleşen dosya/dizin adlarını

*   "Ev dizininde ismi `foo` olan dosya/dizinleri görüntüle"

        !sh
        $ find ~ -name foo

*   "Aramayı dosyalarla sınırla (eşleşen dizinleri hariç tut)"

        !sh
        $ find ~ -type f -name foo

*   Tüm UNIX komutları içinde en sıradışı argüman düzenine sahip komut

---

##  Görev

.fx: achtung

*   Kılavuz dokümanlarından yararlanarak `grep` ve `find` komutlarının
    seçeneklerini inceleyin ve örneklendirin.

*   İki komut bir arada nasıl kullanılabilir?  Şu ana kadar öğrendiğiniz
    bilgilerle bunu sağlayabilir misiniz?

---

##  `xargs`

.

---

##  Ne Nerede?

        /
                home/
                tmp/
                bin/
                sbin/
                etc/
                        init.d/
                        default/
                        rc[0-6S].d
                        cron.d/
                        cron.daily/
                usr/
                        bin/
                        sbin/
                        share/
                                man/
                                doc/
                        lib/
                        include/
                        local/
                                bin/
                                sbin/
                var/
                        log/
                        lib/
                                dpkg/
                        tmp/
                        cache/
                                apt/
                        mail/
                        spool/
                                cups/
                        backups/
                run/
                        lock/
                lib/
                        modules/
                boot/
                        grub/
                dev/
                proc/
                media/
                mnt/
                srv/
                opt/

---

##  Dizin: `/dev`

Bellek çubuğuna sistem kurulumu yap

        !sh
        $ cat mini.iso >/dev/sdb

*   `/dev/sdb` → (bu örnek için) Bellek çubuğunu temsil eden aygıt dosyası

*   `mini.iso` → Önyüklenebilir ("bootable") sistem imajı

*   İmaj dosyası işletim sisteminin `/` dizin hiyerarşisindeki tüm dosya ve
    dizinlerin tek bir dosyada paketlenmiş hali

*   `cat` imaj dosyasını bit-bit bellek çubuğuna kaydediyor

*   İmaj dosyası önyüklenebilir biçimde hazırlanmış olmalı → ilk sektörlerde
    önyükleme kodu bulunmalı

*   Önyükleme kodu → bilgisayar bellek çubuğu ile başlatıldığında işletim
    sistemini yörüngeye oturtan bir "taşıyıcı roket" kaydı

---

##  Dizin: `/dev`

*   Görüldüğü gibi bir aygıta bir dosya gibi erişebiliyorsunuz

*   Aygıt dosyaları `/dev` dizini altında

*   Bu dosyalar aslında ilgili aygıtların sürücüleriyle temas noktaları

*   Aygıt dosyasına erişildiğinde ilgili aygıt yazılımıyla haberleşiyoruz

*   Önkoşul → aygıt yazılımları en basitinden "oku/yaz/denetle" şeklinde bir
    arayüzü ("interface") gerçeklemeli

*   "Aygıtın denetlenmesi" → aygıt davranışının kontrol edilebilmesi; davranışı
    şekillendiren parameterlerin ayarlanabilmesi

---

##  Her Şey Bir Dosya

.fx: achtung

UNIX işletim sistemlerinde "hemen her şey bir dosyadır"

*   İşletim sistemi aktörleriyle bir dosya üzerinden temas kurabilirsiniz

*   Bu aktörler oku/yaz sistem çağrılarına yanıt verecek şekilde düzenlenmiş

---

##  Görev

.fx: task

Aşağıdaki bilgilerin hangi dosya/dizinlerde olduğunu araştırın

*   Kablosuz ağ bağdaştırıcısının sürücüsü ve (varsa) aygıt yazılımı
    ("firmware")

*   Türkçe klavye tanımları

*   İlk açılışta görüntülenen menüdeki metinler (Grub menüsü)

*   Masaüstündeki ikonlar

*   Tarayıcıya kurduğunuz bir eklenti

*   Sisteme hatalı giriş teşebbüsleri (önce bu durumu simüle edin)

*   Python modülleri

---

#   Ek: Kabuk Yapılandırması

---

#   `~/.bashrc`

.

---

#   Ek: Sudo

---

##  Sudo Yapılandırması

Bir kullanıcı sistem yöneticisi olarak nasıl atanır?

*   Bazı dağıtımlarda (ör. Ubuntu ve türevleri) kurulum sırasında hesabı
    oluşturulan kullanıcı aynı zamanda `sudo` hakkına sahip

Şöyle bir mekanizma...

*   `sudo` komutunu "falan gruptaki kullanıcılar `sudo` komutunu çalıştırabilir"
    şeklinde yapılandır (bk. `visudo`)

*   "falan grup" olarak Ubuntu ve türevlerinde `admin` grubunu kullan

*   Kullanıcıyı (kurulum sırasında) `admin` grubuna ekle

---

##  Sudo Yapılandırması

*   Her dağıtımda böyle bir mekanizma sunulmayabilir

*   Ayrıca bu dağıtımlarda `admin` adında bir grup da bulunmayabilir

*   Alternatif olarak `sudo` veya `wheel` gruplarını kullanabilirsiniz; bu
    gruplardan en az bir tanesinin çoğu dağıtımda bulunduğunu varsayıyoruz

---

##  Sudo Yapılandırması

Benzer bir mekanizmayı kurmak için

*   Önce `root` ol (`root` parolasını gir)

        !sh
        $ su

*   `sudo` yapılandırmasına gir

        !sh
        root$ visudo

---

##  Sudo Yapılandırması

Örneğin `sudo` grubu varsa (sistemde bunun yerine `wheel` grubu varsa grup adını
buna uygun şekilde değiştirin)

*   `sudo` grubuna `sudo` çalıştırma hakkı vermek için şöyle bir satır (bu ayar
    zaten yapılmış olabilir)

        !sh
        %sudo   ALL=(ALL:ALL) ALL

*   `roktas` isimli kullanıcıyı `sudo` grubuna ekle

        !sh
        root$ adduser roktas sudo

*   Değişikler mevcut oturumdan çıkıp yeni bir oturuma girdiğinizde etkili olur
