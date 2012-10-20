#   Ruby - Giriş

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

[http://roktas.me/](http://roktas.me/)

Mart 2012

---

#   Ruby

*   Genel amaçlı, nesne yönelimli bir programlama dili

*   Tasarımcısı: Yukihiro "Matz" Matsumoto

*   Çıkış tarihi: 1995

![ruby](media/ruby.svg)

---

#   Temeller

---

#   İlk Kod

        #!ruby
        sum = 0
        i = 1

        while i <= 10 do
          sum += i*i
          i = i + 1
        end

    puts "Kareler toplamı #{sum}"

*   Deyimler satır sonlarıyla ayrılıyor

*   Bloklar `do ... end` ile ayrılıyor

*   İşlev çağrılarında (`puts`) parantezler zorunlu değil (satır 9)

*   Dizgi içinde `#{...}` ile değer (satır 9)

---

#   İşlevler (Metodlar)

        #!ruby
        def sum(upper)
          result, i = 0, 1
          while i <= upper do
            result += i*i
            i += 1
          end
          return result
        end

        puts "Kareler toplamı #{sum(10)}"

*   İşlevler (metodlar) `def ... end` ile

*   Paralel atamalar yapılabilir (satır 2)

*   `#{...}` içinde herhangi bir Ruby ifadesi kullanılabilir (satır 11)

---

#   Deyim/İfade

Ruby'de deyim (statement) ve ifade (expression) ayrımı yok

*   Her şey çalışma anında değerlendirilen ("evaluate" edilen) bir ifade

*   İki tamsayı nesnesiyle kurulan ve `2` değerini dönen bir ifade

        !irb
        irb(main):001:0> 1 + 1
        => 2

*   Bu da bir ifade (nesne kendisini dönüyor)

        !irb
        irb(main):002:0> 1
        => 1

*   Sabit bir nesne (`1`) yerine değişken kullanmak da aynı

        !irb
        irb(main):003:0> i = 1
        => 1
        irb(main):004:0> i
        => 1

---

#   Deyim/İfade

*   Görüntülenenle ifade değerini karıştırmayın

        !irb
        irb(main):001:0> puts 1
        1
        => nil

`nil` nedir?

*   Yokluğu ifade ediyor

*   Python'da `None`, C'de `null` gibi

*   Örnekte `puts` metodu `nil` değeri dönüyor

*   Fakat `puts` metodu `1` değerini görüntülüyor

---

#   İfadeler

Her şeyin bir ifade olması neden önemli?

        !ruby
        flag =
          if x == 0
            false
          else
            true
          end

*   Bu kodu basitçe şöyle yazabilirdiniz

        !ruby
        flag = x == 0

---

#   Doğru/Yanlış

        !ruby
        if x == 0
          false
        else
          true
        end

`0` değeri zaten `false` değil mi?  Hayır, Ruby'de değil.

**Ruby'de sadece `false` ve `nil` "yanlış"; kalan her şey "doğru"**

        !irb
        irb(main):001:0> nil and true
        => false
        irb(main):002:0> 0  and true
        => true
        irb(main):003:0> [] and true
        => true
        irb(main):004:0> "" and true
        => true
        irb(main):005:0> -1 and true
        => true

---

#   Dönüş Değerleri

        #!ruby
        def sum(upper)
          result, i = 0, 1
          while i <= upper do
            result += i*i
            i += 1
          end
          result
        end

        puts "Kareler toplamı #{sum(10)}"

İşlevlerde açık `return` gerekmiyor (satır 7).  Neden?

*   Ruby'de deyim/ifade ayrımı yok; sadece değişkenin ismini yazmak yeterli

*   Metodda son satır bir ifade; kendisi de bir ifade olan metod çağrısının
    değeri

---

#   Nesneler

*   Ruby'de hemen her şey akıllı bir "nesne"

*   Uygun metodlarla uyararak nesnelerin istediğiniz davranışı göstermesini
    sağlayabilirsiniz

*   Dizgiler birer nesne

        !irb
        irb(main):001:0> "This is a test".length
        => 14
        irb(main):002:0> "This is a test".upcase
        => THIS IS A TEST

*   **Sayılar da öyle**

        !irb
        irb(main):003:0> 3.times { puts "Test" }
        Test
        Test
        Test
        => 3

---

#   Bloklar

*   `3` bir tamsayı nesnesi, `times` bu nesnenin bir metodu

*   Öyle ki bu metoda hangi eylemi tekrarlayacağını bildirebiliyorsunuz

*   Nasıl?  Eylemi gerçekleyen bir kod bloğuyla

        !ruby
        { puts "Test" }

*   Kod bloklarını `{...}` yerine `do ... end` ile de yazabiliriz

        !ruby
        3.times do
          puts "Test"
        end

Kodlama stili:

*   Tek satırlık bloklarda kıvrık parantezler

*   Birden fazla satıra yayılan kod blokları için `do ... end`

---

#   Bloklar

Bir işleve eylemde ihtiyaç duyacağı bilgileri argümanlar üzerinden
geçirebiliriz.

        !ruby
        puts "Test"

*   `puts`: Neyi görüntüleyeyim?

*   Çağıran: "Test" dizgisini

Aynı diyaloğu `times` için kurgulayalım.

*   `times`: **kaç** defa **ne** yapacağım?

Ama bu soru hatalı.

*   `times` metodu uyarılırken **kaç** defa bilgisi zaten mevcut

        !ruby
        3.times ...

*   Diyalog `times` ile değil `3` tamsayı nesnesi arasında gerçekleşmeli

---

#   Bloklar

Diyalog:

*   `3`: Ne istiyorsun?

*   Çağıran: Sen **defa** (yani 3 defa) bir şey yapmanı.

*   `3`: Tamam, ben **defa** ne yapacağım?

*   Çağıran: `puts "Test"` ("Test" dizgisini görüntüle).

Sonuçlar:

*   Nesnelere sadece veri değil eylem de bildirilebiliyor

*   Bu sayede çeşitlenebilir davranışlar elde edebiliyoruz

*   Tekrarlama eylemiyle (`times`), tekrarlanacak eylemi (`puts "Test"`)
    ayırıyoruz

*   `times` bir metod, `puts "Test"` ise bu metoda geçirilen bir blok

---

#   Döngüler

Ruby'de döngüleri (tamsayı, dizgi, aralık, dizi, sözlük gibi) nesneler üzerinden
uyarılan tekrarlayıcı metodlarla (örnekte satır 3) kurun.

        #!ruby
        def sum(upper)
          result = 0
          (1..upper).each do |i|
            result += i*i
          end
          result
        end

        puts "Kareler toplamı #{sum(10)}"

*   Bu örnekte `(1..10)` bir aralık ("range") nesnesi

*   Toplama eylemini (bir blok) bu nesnenin `each` metoduna geçiriyoruz

---

#   Döngüler

**Döngüleri `for` ile kurmayın**

        !ruby
        result = 0
        for i in (1..10) do
          result += i*i
        end

        yerine

        !ruby
        result = 0
        (1..10).each do |i|
          result += i*i
        end

*   Ruby'de `for` deyimi hemen hemen daima bir gerçekleme kusuru

*   Bu durum daha nadir olarak `while` için de geçerli

---

#   Diziler

        !ruby
        a = []
        a.push("Word")

Veya daha şık olanı:

        !ruby
        a = []
        a << "Word"

---

#   Diziler

        !ruby
        a = [1, 2, 3]
        a.each do |e|
          puts e
        end

İndisler?

        !ruby
        a = [1, 2, 3]
        a.each_with_index do |e, i|
          puts "#{i}: #{e}"
        end

---

#   Diziler

        !ruby
        a = []
        puts "a is empty" if a.empty?

        a = [1, 2, 3]
        a.include?("x") #=> false
        a.include?(3)   #=> true

---

#   Sözlükler

        !ruby
        person = { "name" => "Fred", "age" => 20, "gender" => "male" }

Fakat anahtarları (çoğu zaman) şöyle yazıyoruz (bazen değerler de öyle):

        !ruby
        person = { :name => "Fred", :age => 20, :gender => :male }

*   `"name"` bir dizgi (`String`)

*   `:name` ise bir sembol (`Symbol`)

---

#   Semboller

*   Değiştirilmez bir dizgi gibi

*   Pek çok işlemde daha hızlı ve güvenli

TODO

---

#   Sözlükler

        !ruby
        person = { :name => "Fred", :age => 20, :gender => :male }

        puts person[:age]       #=> 20
        person.has_key? :age    #=> true
        puts person[:weight]    #=> nil
        person.has_key? :weight #=> false

        person.each do |key, value|
        puts "#{key}: #{value}"
        end

        if person[:gender] == :male && (person[:age] < 18 || person[:age] > 85)
          puts "A very young or old man"
        end

---

#   Dosya İşlemleri

"Eylem blokları" bakış açısını uygulayın

*   Dosya tutamacı nesnesi al

*   Nesneyle bir şeyler yap, örneğin satırları görüntüle

        !ruby
        File.open(filename) do |f|
          f.each do |line|
            puts line
          end
        end

*   Satır numaralarını da ister misiniz?

        !ruby
        File.open(filename) do |f|
          f.each_with_index do |line, no|
              puts "#{no}: #{line}"
          end
        end

---

#   Tek Satırlıklar

Başa dönelim...

*   Ruby'nin standart kitaplığı çok zengindir

*   Kendi icat ettiğiniz bir çözümü gerçeklemeden önce kitaplığa bakın

*   İşinize yarayacak pek çok parça bulabilirsiniz

        !ruby
        puts "Kareler toplamı #{(1..10).inject { |sum, i| sum + i*i }}"

*   `inject`?  Daha sonra...

---

#   Nesne Yönelimli Programlama

---

#   Sınıf ve Nesne

TODO

---

#   Nesne Nitelikleri

TODO

---

#   Sınıf

.code: code/rb_class_simple_point/main.rb

---

#   Sınıf Metodları

Bir nesne için değil ilgili sınıftaki tüm nesneler için anlamlı metodları nasıl
tanımlayacağız?

*   `Point` için örnek: noktaların toplanması (`add`)

*   `Point` için örnek: noktalar arası uzaklık (`distance`)

---

#   Sınıf Metodları

*   Nesne metodları bu ihtiyaca şık bir cevap vermiyor

        !ruby
        class Point
          ...
          def add(other)
            new @x + other.x, @y + other.y
          end
        end

        p, q = Point.new(3, 5), Point.new(9, 1)

        t = p.add(q)
        # veya
        t = q.add(p)

*   Tüm nesneleri ilgilendiren bir eylemin özel bir nesne üzerinden uyarılması
    çok **anlamlı** değil

*   Eylemin `Point` sınıfı üzerinden uyarılması daha anlamlı

        !ruby
        t = Point.add(p, q)

---

#   Sınıf Metodları

*   Bir başka örnek: orijin noktasını veren bir metod

        !ruby
        o = Point.origin # (0, 0) nokta nesnesi

*   Bu metodun bir nokta nesnesi üzerinde uyarılması anlamlı değil

        !ruby
        o = p.origin # (0, 0) nokta nesnesi

---

#   Sınıf Metodları

.code: code/rb_class_classmethod_point/main.rb

---

#   İşleç Yüklemesi

İşleçleri birer metod gibi kullanabilir miyiz?

*   Bu zaten yapılıyor

        !ruby
        i = 3 + 5
        s = "hello " + "world"

*   Örneğin iki noktanın toplanması basitçe şöyle olsa:

        !ruby
        t = p + q

Bunu yapabilirsek sınıf metodları çözümüne alternatif bir çözümümüz olacak

---

#   İşleç Yüklemesi

.code: code/rb_class_overloading_point/main.rb

---

#   Miras Alma

.code: code/rb_inheritance_simple_circle/main.rb

---

#   Sınıf Değişkenleri

Bir nesne için değil ilgili sınıftaki tüm nesneler için anlamlı değerleri nasıl
temsil edeceğiz?

*   `Point` için örnek: kaç tane nokta oluşturuldu?

Benzer bir soruyu metodlar için de sormuştuk?

*   Bir nesne için değil ilgili sınıftaki tüm nesneler için anlamlı metodları
    nasıl tanımlayacağız?

*   `Point` için örnek: noktaların toplanması (`add`)

Tüm nesneler için anlamlı değerler eğer bir sabit ise buna zaten bir çözümümüz
var → Sınıf sabitleri

        !ruby
        class Point
          ORIGIN = 0, 0
          ...
        end

---

#   Sınıf Değişkenleri

.code: code/rb_class_variable_simple/main.rb

---

#   Sınıf Değişkenleri

Sınıf değişkenleriyle çalışırken bir şeyin farkında olmalıyız:

*   Sınıf değişkenleri tüm mirasçı sınıflar tarafından erişilebilir ve
    **değiştirilebilir**

*   Sınıf değişkenleri bir tür sınıf kapsamlı **genel değişken** olarak davranır

*   Genel değişkenlerin sorunlarını biliyorsunuz

---

#   Sınıf İçinde Değişkenler ve Sabitler

.code: code/rb_class_variable_experiment/main.rb

---

#   Sınıf İçinde Değişkenler ve Sabitler

*   Çıktı

.code: code/rb_class_variable_experiment/out

---

#   Sınıf İçinde Değişkenler ve Sabitler

Sonuçlar:

*   Sınıf sabitleri çocuk sınıfta değiştirilmediği sürece ebeveyn'deki değerini
    alıyor

*   Sınıf değişkenleri çocuk sınıflarda değiştirilebiliyor

*   Sınıf nesne değişkenleri çocuk sınıflara miras edilmiyor

*   Sınıf nesne değişkenleri için nitelik erişimcileri tanımlanabiliyor

        !ruby
        class A
          ...
          class << self
            attr :class_instance_variable
          end
        end
        ...
        A.class_instance_variable

---

#   Modüller

Ruby'nin modüler programlama için "sınıf"larla birlikte sunduğu diğer imkan

        !ruby
        module A
          def self.meth
            ...
          end
        end

        A.meth

İki önemli amaca hizmet ediyor:

*   İsim uzayını düzenliyor

*   "Katıştırma" ("Mixins") tekniğiyle gerçeklemelerin paylaşılmasını sağlıyor

---

#   İsim Uzayı

*   `sin` metodu `Math` modülünde tanımlı

        !ruby
        x = Math.sin(0)

Bu sayede:

*   Kod okunurluğu artıyor:  modül ismi metod ismiyle sınırlı anlamı
    pekiştiriyor

*   İsim çakışmaları önleniyor: `sin` isimli bir metod yazdığımızı varsayın?

---

#   İsim Uzayı

`sin`: "sinus", "sin" (günah)?

        !ruby
        def sin(context)
          $stderr.puts "Hatalı bir eylem gerçekleşti: #{context}"
        end

        ...

        x = Math.sin(teta) > 0.5
        if x > 0.5
          sin("hatalı aralıkta değer üretildi: #{x}")
        end

---

#   İsim Uzayı

`sin`: "sinus", "sin" (günah)?

        !ruby
        module Log
          ...
          def self.sin(context)
            $stderr.puts "Hatalı bir eylem gerçekleşti: #{context}"
          end
        end

        x = Math.sin(teta) > 0.5
        if x > 0.5
          Log.sin("hatalı aralıkta değer üretildi: #{x}")
        end

*   `Log` modül isminin anlamı pekiştirdiğine dikkat edin

---

#   İsim Uzayı

*   `log.rb` dosyası

        !ruby
        module Log
          ...
          def self.sin(context)
            $stderr.puts "Hatalı bir eylem gerçekleşti: #{context}"
          end
        end

*   Müşteri kodu (`log.rb` modül yollarında tanımlı)

        !ruby
        require 'log'

        x = Math.sin(teta) > 0.5
        if x > 0.5
          Log.sin("hatalı aralıkta değer üretildi: #{x}")
        end

---

#   Katıştırma

Gerçeklemenin seçtiğiniz bir isim uzayına yerleştirilmesini (katıştırılmasını)
sağlıyor

        !ruby
        require 'log'

        include 'Math' # Mixin

        x = sin(teta) > 0.5
        if x > 0.5
          Log.sin("hatalı aralıkta değer üretildi: #{x}")
        end

*   Katıştırma `include` ile gerçekleşiyor

*   Artık `sin` ismi genel kapsama taşındı

*   Fakat bizim `sin` gerçeklememiz hala `Log` isim uzayında

*   Bize ait `sin` metodu bir modülde bulunmasaydı isim çakışması olacaktı

---

#   Katıştırma

Bir gerçeklemeyi uygun sınıflara, sanki o sınıfta yapılan bir gerçeklemeymiş
gibi, ekleyebiliyoruz.

.code: code/rb_module_mixins_simple/main.rb /module/ $

---

#   Katıştırma

Çok güçlü bir araç

*   Kod paylaşımı için "miras alma" dışında bir yöntem sunuyor

*   Bu yöntem NYP'de genel olarak "komposizyon" olarak da bilinir

*   Bazı dillerde var olan "çoklu miras alma" ("multiple inheritance")
    özelliğini "katıştırma" ile taklit edebilirsiniz

**Mümkün olan her yerde "katıştırma"yı "miras alma"ya tercih edin**

---

#   Asciify

*   Türkçe karakterleri ASCII eşseslileriyle değiştirelim, öyle ki

        Türkçe => Turkce

*   "Ascii"leştir → "Asciify"

---

#   Asciify

.code: code/rb_module_simple_asciify/main4.rb

---

#   Asciify

.code: code/rb_module_simple_asciify/main3.rb

---

#   Asciify

.code: code/rb_module_simple_asciify/main2.rb

---

#   Asciify

Çoklu Dil desteği?  Örneğin Türkçe dışında Almanca

.code: code/rb_module_simple_asciify/main1.rb

---

#   Asciify

*   Kod çok uzadı ve karışıklaştı

*   Modülün kimliği belirsiz

*   Çünkü böyle bir modülü açık bir ihtiyaç üzerine değil "genelleştirme" adına
    yaptık

---

#   Asciify

.code: code/rb_module_simple_asciify/main.rb

---

#   Asciify

*   Bir parça "genellik" iyidir

*   Fakat bu "genelleme"nin maliyeti yüksekse iyi düşünün

*   Tam olarak neye ihtiyaç duyuyoruz?

*   Bugünün ihtiyacını karşıla, maliyetli genellemeyi yarın ki ihtiyaca bırak

Modül tasarımı zordur.  Modülün kimliği açık şekilde tanımlı olmalı.

<!--

TODO Ruby'de çoğu zaman parantez gerekmiyor.  Nasıl anlıyor?  Atamalara bakıyor
(duck typing gibi).

TODO bölümler: Fonksiyonel Programlama, Meta Programlama, Eko Sistem

-->
