# Folyo

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

[http://roktas.me/](http://roktas.me/)

Ekim 2012

---

# Folyo Nedir?

---

## Bir Doküman Türü

Folyo → Bir doküman türü

- Uydurduğumuz bir terim

- Slayt veya sunu değil folyo

- Bu bir bir doküman türü; kitap, makale gibi

- Genel olarak bir konunun özünü anlatmayı kolaylaştıran bir doküman türü

---

## Öncü Doküman

Daha uzun ve kapsamlı bir doküman türüne hazırlık aşamasında kullanılabilir

- Örneğin bir makale yazarken ana fikri önce folyo biçiminde hazırlayabilirsiniz

- Veya bir kitabın bölümlerini önce bir folyoya dökebilirsiniz

- Yani bu bir öncü doküman

---

## Bilgi Aktarımı

Etkili bir bilgi aktarım aracı

- Öğrendiklerinizi başkalarına aktarmanızı kolaylaştırıyor

- Uzun ve düzenli cümlelerden oluşan bir doküman yazmanız gerekmiyor

- Sunum değeri de taşıdığından okunması, izlenmesi kolay

- Sunum değeri taşıyor fakat sunum değil

---

## İçerik ve Sunum

**Folyo tanım olarak bir sunum aracı değil**

- Kısmen sunum değeri var

- Fakat hiç bir zaman içerik değerinin önünde değil

- Bol efektli, zaman alıcı içeriklerden kaçınıyoruz

- İçerik daha önemli

- Amaç içeriğin kolay şekilde oluşturulması, etkili şekilde aktarılması

- Nasıl?

---

## Folyo Hazırlığı

- Ana fikirleri kısa cümleleler halinde sayfalara böl

- Sayfa sıralamasını değiştirerek fikir akışını düzenle

- Her sayfada cümleleri ayrıntılandır

---

## Basit Araçlar

- Özel bir araca gerek yok

- Çok özel bir dosya biçimi de yok

- Öğrenilmesi çok kolay bir hafif etiketleme dili → Markdown

- Basit bir metin düzenleyici

- Düz metin folyo dosyaları

---

# Kurulum

---

## Ruby Kur

    !sh
    $ sudo apt-get install ruby1.9.1-full rake

---

## Ruby `1.9` Ayarla

    !sh
    $ sudo update-alternatives --set ruby /usr/bin/ruby1.9.1

- Folyo inşa sistemi Ruby `1.9` gerektiriyor; bu sistem Ruby `1.8` ile çalışmaz

- Öntanımlı Ruby versiyonunu öğrenmek için

        !sh
        $ ruby --version
        ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-linux]

---

## 19 Depolarını Ekle

    !sh
    $ sudo wget -qO /etc/apt/sources.list.d/19.list deb.ondokuz.biz/19.list
    $ wget -qO- deb.ondokuz.biz/archive.key | sudo apt-key add -
    $ sudo apt-get update

- 19 depolarında özgün Landslide'ın yamalanmış bir sürümü bulunuyor

---

## Landslide Kur

    !sh
    $ sudo apt-get install python-landslide-patched python-misaka

- Resmi depolardaki `python-landslide` paketi yerine 19 depolarındaki
  `python-landslide-patched` paketini kullanmalısınız

- Landslide kurulumunu kontrol etmek için

        !sh
        $ landslide --version
        landslide patched 1.0.1

---

## Yerelde Depo Oluştur

    !sh
    $ git init
    $ touch .gitignore
    $ git add .
    $ git commit -a -m İlk

---

## Üst Depodan İlkle

    !sh
    $ git remote add upstream git://github.com/roktas/fo
    $ git pull upstream master

- Şablon güncellemelerini de `upstream` kaynağından alacağız

---

## Yayın Dalını Ayarla

    !sh
    $ git checkout -b gh-pages
    $ git branch -d master

- Github yayın dalını, yani `gh-pages`'i oluşturuyoruz

---

## Yapılandır

    !sh
    $ rake
    $ git add _/param.yaml
    $ $EDITOR _/param.yaml
    $ rake
    $ git commit -a -m Yapılandır

- `_/param.yaml` dosyasındaki boş alanları dolduruyoruz

- Bir alanı boş bırakmak için `''` girin

---

## Yayınla

    !sh
    $ git remote add origin git@github.com/[hesap]/[depo]
    $ git push origin gh-pages

- Önce Github `[hesap]`'ınızda `[depo]` isimli depoyu oluşturuyoruz

---

# Güncelleme

---

## Güncelle

    !sh
    $ git pull upstream master

- Şablonla birlikte gelen (sizin oluşturmadığınız) dosyaları düzenlememelisinz

- Düzenlemeniz halinde birleştirme çakışması ("merge conflict") yaşayabilirsiniz

---

# Kullanım

---

## İnşa Sistemi

Aşağıdaki `rake` işlemlerini yapabilirsiniz

- Yeni folyo oluştur

        !sh
        $ rake new

- Derle

        !sh
        $ rake

- Folyo İndisini Görüntüle

        !sh
        $ rake view

- Üretilen Dosyaları Sil

        !sh
        $ rake clean

---

## İnşa Sistemi

Sadece tek dosya üzerinde de işlem yapabilirsiniz

- Bulunulan dizindeki `index.md` dosyasını derle

        !sh
        $ rake compile[index.md]

- Bu dosyaya ait derlenmiş dosyayı (`index.html`) görüntüle

        !sh
        $ rake view[index.md]

- Folyoyu Vim ile düzenlerken bu komutlara klavye kısayollarıyla
  erişebilirsiniz (bk. Vim Kısayolları)

---

## Vim Kısayolları

- `F9`  → Düzenlenmekte olan folyoyu derle

- `F10` → Düzenlenmekte olan folyoyu derle ve görüntüle

Kısayolların kurulumu

- [İlgili eklenti
  dosyasını](https://github.com/roktas/x/blob/master/etc/vim/ftplugin/markdown.vim)
  `~/.vim/ftplugin` dizinine kopyalayın

- Bu kısayollar 19/x yapılandırmasında zaten tanımlı

---

# Sözdizimi

---

## Sözdizimi

[Markdown Sözdizimi](]http://daringfireball.net/projects/markdown/syntax)
kullanacaksınız

- Fakat Markdown'ın çeşitli lehçeleri var

- Folyolarda Markdown'ın [Sundown](https://github.com/vmg/sundown) lehçesi
  kullanılıyor

- Dikkat etmeniz gereken hususlar diğer sayfalarda özetlendi

---

# Stil

---

## Başlık

Başlıkları tutarlı olarak aynı biçimde yazın

- İlk harfleri büyük kelimelerden oluşmalı

- Hepsi büyük harf başlıklar kullanmayın

- Sadece ilk harfi büyük başlıklar kullanmayın

---

## Başlık

- Yanlış → "BİR BAŞLIK"

- Yanlış → "Bir başlık"

- Doğru → "Bir Başlık"

---

## Başlık

Başlık satırında taşma olmamalı

- En fazla 28-32 karakter

- İdealde 28'den küçük

- Bu sınırı geçerseniz 28-32 aralığında kalın

---

## Sayfa Düzeni

İçerik yukarıdan aşağıya önem sırasıyla yazılmalı

- Önemli içerik sayfanın üst kısmında olsun

- Daha az önemli içerik alt kısımda

---

## Yanlış

.fx: wrong

- Önemsiz içerik

Önemli içerik

---

## Doğru

.fx: right

Önemli içerik

- Önemsiz içerik

---

## Cümle

Cümle → Bir sayfanın en küçük ögesi

- Sayfa (şekil, tablo ve kod dışında) cümlelerden oluşuyor

- Liste maddeleri de birer cümle

---

## Cümle

Cümleleri tutarlı olarak aynı biçimde yazın

- Büyük harfle başlayın

- Sonda nokta kullanmayın

---

## Cümle

Cümle iki satırı geçmemeli

- En fazla 140-150 karakter

- İdealde 140'tan küçük

- Bu sınırı geçerseniz 140-150 aralığında kalın

---

## Cümle

Cümleler kısa olmalı

- Gereksiz kelimeleri çıkarın

- Cümleleri kurallı yazmak zorunda değilsiniz

- Konuşma üslubunda yazın

---

## Yanlış

.fx: wrong

- Genellikle klavyeyi onparmak kullanan insanların Vim editörüne alışması biraz
  daha kolaydır.

...

---

## Doğru

.fx: right

- Onparmak klavye kullanıcılarının Vim'e alışmaları daha kolay

...

---

## Paragraf

Paragraf → Noktayla ayrılmış cümleler topluluğu

- **Paragraf kullanmayın!**

- Paragraf içeriğini liste biçiminde yazın

- Paragraftaki her cümle bir liste maddesi

---

## Yanlış

.fx: wrong

Vim alışması ve öğrenmesi gerçekten çok sancılı bir metin editörüdür ama
alıştıktan sonra, yani içten gelen içgüdü gibi bir hal aldığında (buna `second
nature` deniyor, yani ellerinizin siz düşünmeden yaptığı işe odaklanması ve
üzerine düşeni yapması) çalışmayı hızlandırıyor.

---

## Doğru

.fx: right

- Vim alışılması zor bir metin editörü

- Bir kere alıştığınızda çalışmanız çok hızlanır

- Alışmak → Bir tür içgüdü, "Second Nature", geliştirmek

- "Second Nature"?  Ellerinizin siz düşünmeden üzerine düşeni yapması

---

## Liste

Liste → Maddelerden oluşmuş cümleler topluluğu

- Sayfada sunulan fikri bir paragraf olarak kurgulayın

- Paragraftaki cümleleri maddelere dönüştürün

---

## Liste

İç içe listelerden kaçının

- Listeler mümkün olduğunca tek seviyeli olmalı

- İç içe listeler çoğunlukla birden fazla sayfaya dağıtılabilir

---

## Liste

Liste bir bütünlük göstermeli

- Bütünlüğü öne çıkarmak için önce düz bir cümle yazın

- Öyle ki düz cümle liste içeriğini özetlesin

- Liste maddeleriyle düz cümledeki fikri ayrıntılandırın

---

## Sabit Genişlikli Yazıtipi

Aşağıdaki ögeler sabit genişlikli yazıtipleriyle yazılmalı

- Kod ögeleri (değişkenler, fonksiyon/metod isimleri vb)

- Dosya ve program adları

- Program çıktıları

---

## Yazım Kuralları

Türkçe'nin yazım kurallarına uyun

- Türk Dil Kurumunun [Yazım
  Kılavuzuna](http://www.tdk.gov.tr/index.php?option=com_content&view=category&id=50)
  sıklıkla başvurun

---

## Sıkça Yapılan Yazım Hataları

- Ayrı yazılması gereken ekler

- Noktalama işaretleri

---

## Hatalı Yazılan Kelimeler

Doğrusu kalın harflerle yazılanlar

- **yalnız** yanlız

- **yanlış** yalnış

- **herkes** herkez

- **doküman** döküman

---

# Makrolar

---

## Code

`.code: code/echo.c`

.code: code/echo.c

---

## Gist

`.gist: 19`

.gist: 19

---

## Shelr

`.shelr: 501b264596608048a40000c5`

.shelr: 501b264596608048a40000c5
