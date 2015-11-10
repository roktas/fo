#   Programlama - Diziler

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

http://r.oktas.us/

Kasım 2015

#   Ortalama hesapla

İki sayının ortalaması?

        !ruby
        x = 3
        y = 5

        ortalama = (x + y)/2

        puts ortalama

#   Ortalama hesapla

Hesap mantığını bir fonksiyona paketle

        !ruby
        def ortalama(a, b)
          (a + b)/2
        end

        puts ortalama(3, 5)

#   Ortalama hesapla

Üç sayının ortalaması?

        !ruby
        def ortalama3(a, b, c)
          (a + b + c)/3
        end

        puts ortalama3 3, 5, 4

#   Ortalama hesapla

Dört sayının ortalaması?

        !ruby
        def ortalama4(a, b, c, d)
          (a + b + c + d)/4
        end

        puts ortalama4 3, 5, 4, 6

**İsim uzayı tükeniyor!**

*   4 adet yeni değişken ismi: `a`, `b`, `c` ve `d`

*   Yeni bir fonksiyon: `ortalama4`

#   Ortalama hesapla

100 sayının ortalaması?

        !ruby
        def ortalama100(?)
          # ???
        end

        puts ortalama100(?)

*   100 adet değişken mi tanımlayacağız?

*   İsimlendirme zaten büyük bir sorun: 100 adet isim bul

*   Değişken adlarını alfabetik seçsek bile yetmez

*   Fonksiyonu çağırırken 100 adet değer geçireceğiz!

#   Ortalama hesapla

1000 sayının ortalaması?

        !ruby
        def ortalama1000(?)
          # ???
        end

        puts ortalama1000(?)

*   İsimlendirme problemi bir yana

*   Her seferinde yeni bir fonksiyon

*   Benzer bir işlem (ortalama) için her seferinde yeni bir fonksiyon

#   Ortalama hesapla

Bir başka veri türüne ihtiyaç var

*   Şu ana kadar gördüğümüz veri türleri yeterli gelmiyor

*   Bu veri türleri "tekil" değerleri temsil ediyordu

*   Çoğula ihtiyaç var

*   Bir değerle ilgilenmiyoruz; bir **değerler topluluğuyla** ilgileniyoruz

*   Bu örnekte türdeş (hepsi tamsayı) değerlerden oluşan bir topluluk

#   Dizi

Özel bir sözdizimi kullanıyoruz

        !ruby
        sayilar = [3, 5, 4]

Üç elemanlı bir dizi

*   Üç eleman fakat tek isim: `sayilar`

*   İsimlendirmede çoğul bir kelime tercih ettik

*   Zorunlu değil, ama şık

*   Köşeli parantezler içinde virgülle ayrılmış **elemanlar**

#   Dizi

Dizi elemanlarına nasıl erişeceğiz?

*   Sayarak, örneğin "(baştan) ikinci eleman"

*   Tek farkla: **saymaya 0'dan başla**

*   Sıfırıncı eleman → `3`

*   Birinci eleman → `5`

*   İkinci eleman → `4`

Yani?  Dizinin **ikinci** elemanı `5` **değil**, `4`

#   Dizi

Dizi elemanlarına sıfırdan itibaren sayarak erişiyoruz

*   Buna "indisleme" diyoruz

*   "ikinci eleman" → "`2` indisli eleman"

*   Sözdizimi?  `sayilar[2]` → `4`

#   Dizi

*   Diziyi tanımla

        !irb
        irb(main):001:0> sayilar = [3, 5, 4]
        => [
                3,
                5,
                4
        ]

*   Elemanlara eriş

        !irb
        irb(main):002:0> sayilar[0]
        => 3
        irb(main):003:0> sayilar[1]
        => 5
        irb(main):004:0> sayilar[2]
        => 4

#   Dizi

*   Varolmayan bir eleman?

        !irb
        irb(main):005:0> sayilar[3]
        => nil
        irb(main):006:0> sayilar[100]
        => nil

Dizide bulunmayan bir elemana eriştiğimizde sonuç?  `nil`

*   Ruby'de `nil` bir değerin yokluğu anlamına geliyor

*   Pek çok dilde olmayan bir elemana erişim bir "çalışma zamanı" (runtime) hatası
  üretir

*   Ruby hata üretmiyor, sessizce `nil` dönüyor

#   Dizi

Ruby'de dizi indisleri genel olarak (`0`'dan başlayan) pozitif tam sayılar,
fakat negatif indisler dışlanmamış

*   Negatif bir indis dizi elemanlarına sondan erişmek için kullanılır

*   Dizinin son elemanı → `-1`, sondan bir önceki eleman → `-2`, ...

        !irb
        irb(main):007:0> sayilar[-1]
        => 4
        irb(main):008:0> sayilar[-2]
        => 5
        irb(main):009:0> sayilar[-3]
        => 3

*   Olmayan bir elemana erişim beklendiği gibi `nil` üretir

        !irb
        irb(main):010:0> sayilar[-4]
        => nil

#   Dizi

Bir dizinin temel özelliği: dizinin uzunluğu veya boyu

*   `sayilar` dizisinde 3 eleman var

*   "`sayilar` dizisi 3 uzunluklu bir dizi"

Dizi uzunluğu ile dizinin son elemanının indisi arasındaki ilişkiye dikkat!

*   3 uzunluklu bir dizide son elemanın indisi `2`

*   Son elemanının indisi dizi uzunluğunun **bir eksiği**

*   Dizinin uzunluğu son elemanın indisinin **bir fazlası**

#   Dizi

O halde özetleyelim

*   İlk eleman → `0`

*   Son eleman → `-1` veya `dizi uzunluğu - 1`

#   Dizi

*   Dizi indislerini sadece dizi elemanlarına okuma erişimi yapmakta
    kullanmıyoruz

*   Dizi elemanlarına yazmak için de indisleri kullanıyoruz

        !irb
        irb(main):011:0> sayilar = [3, 5, 4]
        => [
                3,
                5,
                4
        ]
        irb(main):012:0> sayilar[1] = 19
        => 19
        irb(main):013:0> sayilar
        => [
                3,
                19,
                4
        ]

#   Dizi

Dizi uzunluğunu nasıl hesaplarız?  Bir Fikir:

*   `0`'dan itibaren saymaya başla

*   Dizi elemanlarına sırayla eriş

*   Eriştiğimiz eleman `nil` ise artık dizi tükenmiştir

*   O halde hangi indiste kalmışsak bu dizi uzunluğudur

#   Dizi

Şimdi bu fikri uygulayalım

        !ruby
        sayilar = [3, 5, 4]

        i = 0 # ilk indis
        while sayilar[i] != nil
          i += 1
        end

        puts "Uzunluk: #{i}"

#   Ortalama hesapla

Artık dizileri kullanabiliriz

        !ruby
        def ortalama3(a, b, c)
          (a + b + c)/3
        end

        sayilar = [3, 5, 4] # a, b, c yerine

        puts ortalama3 sayilar[0], sayilar[1], sayilar[2]

Doğru mu oldu?

*   Ortalaması alınacak sayılar için dizi kullandık, bu güzel

*   Fakat `ortalama3` isimli fonksiyona dokunmadık

*   Dizilerden tam olarak yararlanamadık

#   Ortalama hesapla

100 elemanlı bir dizinin ortalamasını nasıl hesaplayacağız?

        !ruby
        def ortalama100(?)
          # ???
        end

        sayilar = [...] # 100 elemanlı bir dizi

        puts ortalama100(?)

*   `ortalama100` isimli fonksiyona 100 adet değerin geçirilmesi sorunu aynen
    devam ediyor

Bu bir yana...

*   100 eleman için yapılan 3 eleman için yapılanla benzer

*   Fakat her iki işlem için farklı fonksiyonlar tanımlamak zorunda kalıyoruz

#   Ortalama hesapla

Dizilerden tam olarak yararlanalım

        !ruby
        def ortalama(dizi)
          toplam = 0
          i = 0
          while dizi[i] != nil
            toplam += dizi[i]
            i += 1
          end
          toplam/i
        end

**Fonksiyon argümanı artık bir dizi**

#   Ortalama hesapla

Bakın bu fonksiyon dizi uzunluklarındaki farklılıkları yönetiyor

*   İsimlendirmeye dikkat!  `ortalama100` veya `ortalama3` değil!

*   Dizi uzunluğu ne olursa olsun doğru ortalamayı hesaplıyor

Fonksiyonu nasıl çağıracağız?

        !ruby
        sayilar = [...] # istenilen uzunlukta bir dizi

        puts "Ortalama: #{ortalama(sayilar)}"

*   Dizi adını fonksiyona vermemiz yeterli

#   Dizi

Dizi adı fonksiyonun diziye erişimi için gerekli ve yeterli bir referans

*   100 elemanlı bir dizi düşünün

*   Fonksiyon çağrıldığında 100 değeri teker teker fonksiyona kopyalamak
    gerekmiyor

*   100 değer bellekte bir bölgede sıralı olarak bekliyor

*   Yapılması gereken tek şey bu bölgenin adını fonksiyona iletmek

*   Dizi için tanımladığınız değişken adı tamamen buna yarıyor

        !ruby
        sonuc = ortalama(sayilar)

*   `ortalama` fonksiyonu `sayilar` ismiyle bu bölgeye erişiyor (fonksiyon kendi
    içinde bu bölgeyi `dizi` olarak isimlendirmiş)

#   Dizi ve Dizgi

Dizi → Array, Dizgi → String

*   Dizgilere elemanlarının her biri karakter olan bir dizi gibi bakabilirsiniz

        !irb
        irb(main):013:0> s = "merhaba"
        => "merhaba"
        irb(main):015:0> s[0]
        => "m"
        irb(main):016:0> s[5]
        => "b"
        irb(main):017:0> s[6]
        => "a"
        irb(main):018:0> s[7]
        => nil
        irb(main):019:0> s[-1]
        => "a"

#   Dizi ve Dizgi

Gerek diziler gerekse de dizgilerde kullanılabilecek uzunluk hesaplayan bir
fonksiyon

        !ruby
        def length(a)
          i = 0
          while a[i] != nil
            i += 1
          end
          i
        end

        kelime = "merhaba"
        puts "'#{kelime}' #{length kelime} uzunluklu bir kelimedir"

#   Dizi uzunluğu

Şu ana kadar verdiğimiz örneklerde dizi (veya dizgi) uzunluklarını kendimiz
hesapladık

*   `0`'dan itibaren saymaya başla

*   Dizi elemanlarına sırayla eriş

*   Eriştiğimiz eleman `nil` ise artık dizi tükenmiştir

*   O halde hangi indiste kalmışsak bu dizi uzunluğudur

Bu yöntemin dayandığı özellik: dizi `nil` değerli bir eleman içeremez

*   Bir dizi olarak yorumlandığında bu özellik dizgiler için geçerli

*   Fakat genel anlamda diziler için böyle bir koşul öne süremeyiz

#   Dizi uzunluğu

*   Bir dizinin elemanları `nil` değeri alabilir

*   Dizi elemanları türdeş olmak zorunda da değildir

        !irb
        irb(main):020:0> a = [3, nil, "foo"]
        => [
                3,
                nil,
                "foo"
        ]
        irb(main):021:0> a[0]
        => 3
        irb(main):022:0> s[1]
        => nil
        irb(main):023:0> s[2]
        => "foo"
        irb(main):024:0> s[3]
        => nil

Örnekte verilen dizi için kendi yazdığımız `length` fonksiyonu ne değer döner?

#   Dizi uzunluğu

*   Dizi uzunluğu bir dizinin temel özelliklerinden biridir

*   Bu denli temel bir özelliğin belirlenmesi için kendi fonksiyonumuzu yazmaya
    gerek olmaması lazım

Bu bir yana:

*   Yazdığımız fonksiyon dizgilerde doğru çalışıyor

*   Dizilerde hatalı çalışıyor

#   Dizi uzunluğu

Ruby'de dizi uzunluğunu nasıl öğreniriz?

*   `length` metoduyla

*   Ruby'de dizi nesnelerinin uzunluğunu basitçe şöyle öğreniyoruz

        !ruby
        a = [3, 5, 4]
        a.length #=> 3

*   Bu metodun bir başka adı: `size`

#   Ortalama hesapla

O halde ortalama hesabını `.length` metodunu kullanarak yapalım

        !ruby
        def ortalama(dizi)
          toplam = 0
          i = 0
          while  i < dizi.length
            toplam += dizi[i].to_i
            i += 1
          end
          toplam/dizi.length
        end

*   Önceki versiyonlarla aradaki farkları lütfen not edin

*   Bu versiyonun dizide `nil` değerli eleman olsa bile doğru çalıştığına dikkat
    edin (`nil.to_i #=> 0`)

#   Dizi uzunluğu

Kendi yazdığımız `length` ile yerleşik bir metod olan `length` arasındaki
farklara dikkat edin

        !ruby
        a = [3, 5, 4]

        length(a) # bizim yazdığımız
        a.length

*   Uzunluğu istenen dizi bizim yazdığımız fonksiyonda argüman olarak veriliyor

        !ruby
        length(a)

*   Diğerinde ise uzunluğu istenen dizi bilgisi metodun uyarıldığı nesne
    üzerinden veriliyor

        !ruby
        a.length

*   Bizim yazdığımız fonksiyon `nil` değer içeren dizilerde hatalı sonuç üretir

*   Yerleşik metod daima doğru ve yerleşik olmasından daha hızlı sonuç üretir

#   Fonksiyon ve Metod

*   Bir nesne üzerinden çağrılan fonksiyonlara özel olarak "metod" adını veriyoruz

        !ruby
        length(a) # length fonksiyonu
        a.length  # length metodu

*   Gerek fonksiyon gerekse metod benzer bir işi yapar

*   Ona verdiğiniz argümanlara bağlı olarak hesap yapan bir kod parçasını
    çalıştırır ve hesap sonucunu çağırana döner

#   Fonksiyon ve Metod

Metod ve fonksiyon arasındaki en temel fark:

*   Metodlarda ilgili kod parçasına iletilen bir argüman daima vardır: metodun
    kendisi üzerinden çağrıldığı nesne

*   Yani `.`'nın sol tarafı ilgili kod parçasına daima argüman olarak gönderiliyor

*   Örnek: `line` değişkeni (`.`'nın sol tarafı) `chomp` metoduna argüman olarak girer

        !ruby
        line = "foo\n"
        line.chomp #=> "foo"

*   Örnek: "merhaba" değeri `upcase` metoduna argüman olarak girer

        !ruby
        "merhaba".upcase #=> "MERHABA"

#   Fonksiyon ve Metod

Ama farklılıklar **pratikte** bununla sınırlı değil

*   Bir fonksiyon tanımlarken seçtiğimiz fonksiyon adının daha önceden
    tanımlanan bir fonksiyonun adıyla çakışmadığına dikkat etmeliyiz

*   Aksi halde önceki fonksiyonun üzerine yazmış oluruz, tıpkı bir değişkenin
    tekrar tanımlanması gibi

#   Fonksiyon ve Metod

Metodlarda (pratikte) böyle bir sorunumuz olmaz, neden?

*   `.`'nın sol tarafındaki nesne adı çakışmayı önleyen bir isim ön eki gibi
    davranır

*   Örneğin kendi yazdığımız `length` isimli fonksiyon hiçbir şekilde `.length`
    metoduyla çakışmaz

#   Fonksiyon ve Metod

Metodlar bir nesne üzerinden çağrılan ve o türde nesneler için anlamlı bir
fonksiyon kümesidir

*   Nasılki bir amaç doğrultusunda yazılan birbiriyle ilişkili fonksiyonları tek
    bir dosyada toplayarak yazıyoruz

*   Metodları da ilgili nesnenin ait olduğu sınıf içinde yazıyoruz

*   Bu programlama yöntemine (kabaca) "Nesne Yönelimli Programlama" diyoruz

*   Gelecekte bu konuyu açacağız

#   Ek: Gotcha

#   Dizi

Dizi adı çağırdığımız fonksiyona hangi dizi üzerinde çalışacağını anlatan bir
tür "bellek bölgesi etiketi"

*   Bu sayede dizi elemanlarını her seferinde fonksiyona kopyalamamış oluyoruz

*   Fonksiyon bu etiketle anılan bölgeye kolayca erişiyor

*   Yani etiket fonksiyona bir odaya girmesi için verdiğimiz bir anahtar

Fakat bu erişim yöntemi beklenmeyen sonuçlar da üretebilir

*   Anahtarı verdiğimiz fonksiyon sorumlu davranmalı

*   Fonksiyon odaya girdiği anda orayı talan da edebilir

#   Dizi

İnceleyin

        !ruby
        def ortalama(dizi)
          toplam = 0
          i = 0
          while dizi[i] != nil
            toplam += dizi[i]
            i += 1
          end
          dizi[0] = nil # (örneğin) ilk elemanı nil ile değiştir
          toplam/i
        end

        sayilar = [3, 5, 4]
        puts "Ortalama: #{ortalama sayilar}" #=> 4
        puts sayilar[0] #=> nil

#   Dizi

Bakın bu örnekte fonksiyon odada bir şeyleri değiştirdi

*   Fonksiyon sadece hesap yapmadı

*   Kendisine verilen dizide bir değişiklik yaptı (ilk elemanı değiştirdi)

*   Bu bazen bilinçli olarak yapılmasını istediğimiz bir değişiklik de olabilir

#   Dizi

Aşağıdaki kod ne üretir?

        !ruby
        def ortalama(dizi)
          toplam = 0
          i = 0
          while dizi[i] != nil
            toplam += dizi[i]
            i += 1
          end
          dizi[0] = nil # (örneğin) ilk elemanı nil ile değiştir
          toplam/i
        end

        sayilar = [3, 5, 4]
        puts "Ortalama: #{ortalama sayilar}" #=> 4
        puts "Ortalama: #{ortalama sayilar}" #=> ?
