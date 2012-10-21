#   Folyo

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

[http://roktas.me/](http://roktas.me/)

Ekim 2012

---

##  Bir Doküman Türü

Folyo → Bir doküman türü

*   Uydurduğumuz bir terim

*   Slayt veya sunu değil folyo

*   Bu bir doküman türü; kitap, makale gibi

*   Genel olarak bir konunun özünü anlatmayı kolaylaştıran bir doküman türü

---

##  Öncü Doküman

Daha uzun ve kapsamlı bir doküman türüne hazırlık aşamasında kullanılabilir

*   Örneğin bir makale yazarken ana fikri önce folyo biçiminde
    hazırlayabilirsiniz

*   Veya bir kitabın bölümlerini önce bir folyoya dökebilirsiniz

*   Bir öncü doküman

---

##  Bilgi Aktarımı

Etkili bir bilgi aktarım aracı

*   Öğrendiklerinizi başkalarına aktarmanızı kolaylaştırıyor

*   Uzun ve düzenli cümlelerden oluşan bir doküman yazmanız gerekmiyor

*   Sunum değeri de taşıdığından okunması, izlenmesi kolay

*   Sunum değeri taşıyor fakat sunum değil

---

##  İçerik ve Sunum

**Folyo tanım olarak bir sunum aracı değil**

*   Kısmen sunum değeri var

*   Fakat hiç bir zaman içerik değerinin önünde değil

*   Bol efektli, zaman alıcı içeriklerden kaçınıyoruz

*   İçerik daha önemli

*   Amaç içeriğin kolay şekilde oluşturulması, etkili şekilde aktarılması

*   Nasıl?

---

##  Folyo Hazırlığı

*   Ana fikirleri kısa cümleleler halinde sayfalara böl

*   Sayfa sıralamasını değiştirerek fikir akışını düzenle

*   Her sayfada cümleleri ayrıntılandır

---

##  Basit Araçlar

*   Özel bir araca gerek yok

*   Çok özel bir dosya biçimi de yok

*   Öğrenilmesi kolay bir hafif etiketleme dili → Markdown

*   Basit bir metin düzenleyici

*   Düz metin folyo dosyaları

---

#   Kurulum ve Kullanım

---

##  Ruby Kur

        !sh
        $ sudo apt-get install ruby1.9.1-full rake

---

##  Ruby Ayarla

    !sh
    $ sudo update-alternatives --set ruby /usr/bin/ruby1.9.1

*   Folyo inşa sistemi Ruby `1.9` gerektiriyor; bu sistem Ruby `1.8` ile
    çalışmaz

*   Öntanımlı Ruby versiyonunu öğrenmek için

        !sh
        $ ruby --version
        ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-linux]

---

##  Paket Depolarını Ekle

        !sh
        $ sudo wget -qO /etc/apt/sources.list.d/19.list deb.ondokuz.biz/19.list
        $ wget -qO- deb.ondokuz.biz/archive.key | sudo apt-key add -
        $ sudo apt-get update

*   19 depolarında Landslide'ın yamalanmış bir sürümü bulunuyor

---

##  Landslide Kur

        !sh
        $ sudo apt-get install python-landslide-patched python-misaka

*   Resmi depolardaki `python-landslide` paketi yerine 19 depolarındaki
    `python-landslide-patched` paketini kullanmalısınız

*   Landslide kurulumunu kontrol et

        !sh
        $ landslide --version
        landslide patched 1.0.1

---

##  Yerelde Depo Oluştur

        !sh
        $ git init
        $ touch .gitignore
        $ git add .
        $ git commit -a -m İlk

---

##  Üst Depodan İlkle

        !sh
        $ git remote add upstream git://github.com/roktas/fo
        $ git pull upstream master

*   Şablon güncellemelerini de `upstream` kaynağından alacağız

---

##  Yayın Dalını Ayarla

        !sh
        $ git checkout -b gh-pages
        $ git branch -d master

*   Github yayın dalını, yani `gh-pages`'i oluşturuyoruz

---

##  Yapılandır

        !sh
        $ rake
        $ git add _/param.yaml
        $ $EDITOR _/param.yaml
        $ rake
        $ git commit -a -m Yapılandır

*   `_/param.yaml` dosyasındaki boş alanları dolduruyoruz

*   Bir alanı boş bırakmak için `''` girin

---

##  Yayınla

        !sh
        $ git remote add origin git@github.com/[hesap]/[depo]
        $ git push origin gh-pages

*   Önce Github `[hesap]`'ınızda `[depo]` isimli depoyu oluşturuyoruz

---

##  Güncelleme

        !sh
        $ git pull upstream master

*   Şablonla birlikte gelen (sizin oluşturmadığınız) dosyaları düzenlememelisinz

*   Düzenlemeniz halinde birleştirme çakışması ("merge conflict")
    yaşayabilirsiniz

---

##  Düzenleme

[Markdown Sözdizimini](]http://daringfireball.net/projects/markdown/syntax)
kullanacaksınız

*   Diğer bir [başvuru kaynağı](http://www.markdown-ref.org/)

*   Markdown'ın çeşitli lehçeleri var

*   Folyolarda Markdown'ın [Sundown](https://github.com/vmg/sundown) lehçesi
    kullanılıyor

---

##  Folyo Biçimi

[Bu folyoyu](https://raw.github.com/roktas/fo/gh-pages/fo-intro/index.md)
inceleyerek başlayabilirsiniz

*   Sayfalar için kullanılan ayırıcılar ve bazı makrolar dışında her şey
    Markdown

*   Lehçe farklılıklarına dikkat edin

---

##  İnşa Sistemi

Aşağıdaki `rake` işlemlerini yapabilirsiniz

*   Yeni folyo oluştur

        !sh
        $ rake new

*   İnşa et

        !sh
        $ rake

*   Folyo indisini görüntüle

        !sh
        $ rake view

*   Üretilen dosyaları sil

        !sh
        $ rake clean

---

##  İnşa Sistemi

Sadece tek dosya üzerinde de işlem yapabilirsiniz

*   Bulunulan dizindeki `index.md` dosyasını derle

        !sh
        $ rake compile[index.md]

*   Bu dosyaya ait derlenmiş dosyayı (`index.html`) görüntüle

        !sh
        $ rake view[index.md]

*   Vim ile düzenlerken komutlara klavye kısayollarıyla erişebilirsiniz

---

##  Vim Kısayolları

*   `F9`  → Folyoyu derle

*   `F10` → Folyoyu derle ve görüntüle

Kısayolların kurulumu

*   [İlgili eklenti
    dosyasını](https://github.com/roktas/x/blob/master/etc/vim/ftplugin/markdown.vim)
    `~/.vim/ftplugin` dizinine kopyalayın

*   Bu kısayollar 19/x yapılandırmasında zaten tanımlı

---

#   Stil

---

##  Sayfa Düzeni

İçerik yukarıdan aşağıya önem sırasıyla yazılmalı

*   Önemli içerik sayfanın üst kısmında olsun

*   Daha az önemli içerik alt kısımda

---

##  Yanlış

.fx: wrong

*   Önemsiz içerik

Önemli içerik

---

##  Doğru

.fx: right

Önemli içerik

*   Önemsiz içerik

---

##  Cümle

Cümle → Bir sayfanın en küçük ögesi

*   Sayfa (şekil, tablo ve kod dışında) cümlelerden oluşuyor

*   Liste maddeleri de birer cümle

---

##  Cümle

Cümleleri tutarlı olarak aynı biçimde yazın

*   Büyük harfle başlayın

*   Sonda nokta kullanmayın

---

##  Cümle

Cümle iki satırı geçmemeli

*   En fazla 140-150 karakter

*   İdealde 140'tan küçük

*   Bu sınırı geçerseniz 140-150 aralığında kalın

---

##  Cümle

Cümleler kısa olmalı

*   Gereksiz kelimeleri çıkarın

*   Cümleleri kurallı yazmak zorunda değilsiniz

*   Konuşma üslubunda yazın

---

##  Yanlış

.fx: wrong

*   Genellikle klavyeyi onparmak kullanan insanların Vim editörüne alışması
    biraz daha kolaydır.

...

---

##  Doğru

.fx: right

*   Onparmak klavye kullanıcılarının Vim'e alışmaları daha kolay

...

---

##  Paragraf

Paragraf → Noktayla ayrılmış cümleler topluluğu

*   **Paragraf kullanmayın!**

*   Paragraf içeriğini liste biçiminde yazın

*   Paragraftaki her cümle bir liste maddesi

---

##  Yanlış

.fx: wrong

Vim alışması ve öğrenmesi gerçekten çok sancılı bir metin editörüdür ama
alıştıktan sonra, yani içten gelen içgüdü gibi bir hal aldığında (buna "second
nature" deniyor, yani ellerinizin siz düşünmeden yaptığı işe odaklanması ve
üzerine düşeni yapması) çalışmayı hızlandırıyor.

---

##  Doğru

.fx: right

*   Vim alışılması zor bir metin editörü

*   Bir kere alıştığınızda çalışmanız çok hızlanır

*   Alışmak, bir türü içgüdü geliştirmek → "Second Nature"

*   "Second Nature"?  Ellerinizin siz düşünmeden üzerine düşeni yapması

---

##  Liste

Liste → Maddelerden oluşmuş cümleler topluluğu

*   Sayfada sunulan fikri bir paragraf olarak kurgulayın

*   Paragraftaki cümleleri maddelere dönüştürün

---

##  Liste

İç içe listelerden kaçının

*   Listeler mümkün olduğunca tek seviyeli olmalı

*   İç içe listeler çoğunlukla birden fazla sayfaya dağıtılabilir

---

##  Liste

Liste bir bütünlük göstermeli

*   Bütünlüğü öne çıkarmak için önce düz bir cümle yazın

*   Öyle ki düz cümle liste içeriğini özetlesin

*   Liste maddeleriyle düz cümledeki fikri ayrıntılandırın

---

##  Liste

        !text
        *   Bir madde

        *   İkinci madde

            + Alt madde

            + Başka bir alt madde

        *   Başka bir madde

*   Madde imi olarak birinci seviye listelerde `*`, ikinci seviye listelerde `+`
    kullanın

---

##  Liste

*   Birinci seviye listelerde madde iminden sonra **3 boşluk** bırakın

*   Maddelerde (varsa) devam paragraflarını 4 boşluk girintiyle yazın

        !text
        *   Bir madde

            Bu maddenin devamı bir paragraf

        *   İkinci madde

---

##  Başlık

Başlıkları tutarlı olarak aynı biçimde yazın

*   İlk harfleri büyük kelimelerden oluşmalı

*   Hepsi büyük harf başlıklar kullanmayın

*   Sadece ilk harfi büyük başlıklar kullanmayın

---

##  Başlık

*   Yanlış → "BİR BAŞLIK"

*   Yanlış → "Bir başlık"

*   Doğru → "Bir Başlık"

---

##  Başlık

Başlık satırında taşma olmamalı

*   En fazla 28-32 karakter

*   İdealde 28'den küçük

*   Bu sınırı geçerseniz 28-32 aralığında kalın

---

##  Başlık

        !text
        #<3 boşluk>Bir Başlık

İlk üç seviye başlık iminden sonra 5'nci sütuna kadar boşluk bırakmanızı
öneririz

*   Daha estetik ve liste imleriyle uyumlu oluyor

*   Fakat şart değil

---

##  Başlık

Bir dosyada en fazla iki seviyeli başlıklandırma kullanın

*   İlk seviye → `#`, ikinci seviye → `##`

*   Üçüncü seviyeye girmeyin

*   Üçüncü seviye folyonun çok büyüdüğünü gösterir

*   Dosyayı bölerek yeni bir düzenleme yapın

---

##  Blok Kod

        !text
        <8 boşluk> !ruby
        <8 boşluk> puts "Merhaba"

*   Blok kodları daima 8 boşluk girintiyle yazın (sekmeyi 8 boşluğa çevirin)

*   8 boşluk kuralı düz paragraf ve birinci seviye listeler için geçerli

*   İkinci seviyeden itibaren her seviyede girintiyi 8 boşluk arttırın

*   Sözdizimi renklendirmesi için bloğun ilk satırında `!<dil>` ile dil
    bildirimi yapın

*   Satır numaralarını görüntülemek için `#!<dil>` bildirimini kullanın

        !text
        #!ruby
        puts "Merhaba"

---

##  Blok Kod

Uygun dil bildirimi yapmayı unutmayın

*   Kabuk kodları için (Bash'e özgü bir sözdizimi yoksa) `sh` dilini kullanın

*   Etkileşimli kabuk komutları için komut istemini `$` ile belirtin

        !text
        !sh
        $ ls

---

##  Blok Kod

Uzun blok kodlardan kaçının

*   Bunun yerine ilgili kodu bir dosyaya yerleştirerek `.code` makrosuyla içeri
    aktarın

*   Kod dosyaları için folyo dizininde `code` adında bir alt dizin kullanın

        !text
        .code: code/echo.c

---

##  Sabit Genişlikli Yazıtipi

Aşağıdaki ögeler sabit genişlikli yazıtipleriyle yazılmalı

*   Kod ögeleri (değişkenler, fonksiyon/metod isimleri vb)

*   Dosya/dizin ve program adları

*   Program çıktıları

---

##  Resim

        !text
        ![Resim başlığı](media/resim.png)

*   Resim dosyaları için folyo dizininde `media` adında bir alt dizin kullanın

---

##  Resim

Resimlerin sayfada taşmamasını sağlayın

*   Gerekiyorsa resmi ön işlemeden geçirerek ölçekleyin

*   Resmin yatay uzunluğu dikeyden uzunluğundan daha büyük olmalı

*   `4:3` oranını tercih edin

*   Örneğin `1024x768` geometrili bir resmi `640x480` geometrisine çevirmek için

        !sh
        $ convert -resize 640 resim-1024.png resim-640.png

---

##  Resim

Resimlerin büyük boyutlu olmamasına dikkat edin

*   Genel olarak 50 kB'ı geçmemeli

*   Çizimler için PNG, gerçek resimler için JPEG biçimlerini tercih edin

*   Resim boyutlarını `pngnq`, `jpegoptim` gibi araçlarla düşürebilirsiniz

*   En önemli küçültme yönteminin resim geometrisini düzenlemek olduğunu
    unutmayın

---

##  Yazım Kuralları

Türkçe'nin yazım kurallarına uyun

*   Türk Dil Kurumunun [Yazım
    Kılavuzuna](http://www.tdk.gov.tr/index.php?option=com_content&view=category&id=50)
    sıklıkla başvurun

---

##  Sıkça Yapılan Yazım Hataları

*   Ayrı yazılması gereken ekler

*   Bitişik yazılması gereken ekler

*   Noktalama işaretleri

---

##  Hatalı Yazılan Kelimeler

Doğrusu kalın harflerle yazılanlar

*   **yalnız** yanlız

*   **yanlış** yalnış

*   **herkes** herkez

*   **doküman** döküman

---

#   Makrolar

---

##   `.code` Makrosu

`.code: code/echo.c`

.code: code/echo.c

---

##   `.gist` Makrosu

`.gist: 19`

.gist: 19

---

##   `.shelr` Makrosu

`.shelr: 501b264596608048a40000c5`

.shelr: 501b264596608048a40000c5
