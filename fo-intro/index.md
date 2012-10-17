# Folyo Nedir?

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

[http://roktas.me/](http://roktas.me/)

Ekim 2012

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
    $ $EDITOR _/param.yaml
    $ rake
    $ git commit -a -m Yapılandır

- `_/param.yaml` dosyasındaki boş alanları dolduruyoruz

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

## Sözdizimi

[Markdown Sözdizimi](]http://daringfireball.net/projects/markdown/syntax)
kullanacaksınız

- Fakat Markdown'ın çeşitli lehçeleri var

- Folyolarda Markdown'ın [Sundown](https://github.com/vmg/sundown) lehçesi
  kullanılıyor

- Dikkat etmeniz gereken hususlar diğer sayfalarda özetlendi

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
