# Ruby - Lahikalar

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

[http://roktas.me/](http://roktas.me/)

Mart 2012

---

# İfade/Deyim

Ruby'de ifade/deyim ayrımı yoktur, her şey bir ifadedir (değer üretir).

- `if`, `case`, metod, bloklarda üretilen değer son deyimden gelir

- `while`, `for` deyimleri daima `nil` üretir

---

# Doğru/Yanlış

- Ruby'de sadece `false` ve `nil` mantıksal olarak "yanlış" değer üretir

- Kalan her şey "doğru" değer üretir

        !ruby
        nil and true #=> false

        0  and true  #=> true
        [] and true  #=> true
        "" and true  #=> true
        -1 and true  #=> true

- İpucu: Bir nesneyi mantıksal bir değere çevirmek için `!!` işlecini kullanın

        !ruby
        !! nil #=> false

        !! 0   #=> true
        !! []  #=> true
        !! ""  #=> true
        !! -1  #=> true

---

# `and` ve `or` Öncelikleri

`and` ve `or` operatörleri düşük önceliğe sahiptir.

- Bu operatörler `=` operatöründen daha düşük öncelikli (`=` önce işlenir)

        !ruby
        y = false
        z = true

        x = y or z #=> true
        x          #=> false

---

# `case` Deyimleri

C dilinden farklı olarak, `case` deyimlerinde `when` cümlelerinden sonra daima
deyimden çıkılır.

---

# `!` Metodları

Metod isminin sonundaki `!` "dikkatli olunması gereken bir eylem gerçekleşiyor"
olarak yorumlanmalıdır.

- Bu **çoğunlukla** alıcı nesnede bir şeylerin değiştirildiği manasına gelir

        !ruby
        "foo".delete! #=> "f"

- Metod ismi zaten bunu anlatıyorsa `!` son ekine gerek yoktur

        !ruby
        hash.update :foo => "bar"

---

# `!` Metodları

Alıcı nesnede değişiklik yapmayan `!` metodlarda varolabilir.  Örnek:

- Hata halinde istisna üretme

        !ruby
        u = User.create :login => "joe"

- Hata halinde istisna üret

        !ruby
        u = User.create! :login => "joe"

---

# Sınıflar ve Nesneler

- Her sınıf `Class` sınıfında bir nesnedir.

        !ruby
        class Foo
        end

        Foo.class #=> Class < Module
        Foo.instance_of? Class #=> true

- `Object` isimli sınıf da `Class` sınıfında bir nesnedir.

---

# Nesne Nitelik Erişimcileri

Metod gövdesindeki nitelik yazıcıları yerel değişken üretir.

- Örnekte 4'ncü satırda `bar` niteliğine yazılmaz; `baz` metodunda yerel bir
  `bar` değişkeni üretilir

        !!ruby
        class Foo
          attr_writer :bar
          def baz
            bar = 19
          end
        end

- Nitelik yazıcısının doğru şekilde çözülmesi için `self` ile açık niteleme
  yapın

        !!ruby
        class Foo
          attr_writer :bar
          def baz
            self.bar = 19
          end
        end

---

# Nesne Nitelik Erişimcileri

- Nitelik erişimcisinde özel bir lojik olmadığı sürece en doğrusu `@` ile açıkça
  niteleme yapın

        !!ruby
        class Foo
          attr_writer :bar
          def baz
            @bar = 19
          end
        end

- Nitelik erişimcisinde (okuyucu veya yazıcı farketmez) özel bir erişim lojiği
  varsa `self` kullanın

        !!ruby
        class Foo
          def bar=(value)
            value*value
          end
          def baz
            self.bar = 19
          end
        end

---

# İlişkisiz Metodlar

Ruby'de görünürde herhangi bir sınıfa ait olmayan işlevler `Object` sınıfına ait
`private` metodlardır.

- `private` semantiğinden dolayı bir nesne üzerinden uyarılması gerekmez

- Sonuç: tepe seviyede yazılan tüm metodlar yapısal bir dilde olduğu gibi
  çalıştırılır

---

# Sınıf İçinde Değişkenler ve Sabitler

.code: rb_class_variable_experiment/main.rb

---

# Sınıf İçinde Değişkenler ve Sabitler

- Çıktı

.code: rb_class_variable_experiment/out

---

# Sınıf İçinde Değişkenler ve Sabitler

Sonuçlar:

- Sınıf sabitleri çocuk sınıfta değiştirilmediği sürece ebeveyn'deki değerini
  alıyor

- Sınıf değişkenleri çocuk sınıflarda değiştirilebiliyor

- Sınıf nesne değişkenlerinin değeri çocuk sınıflara miras edilmez

- Sınıf nesne değişkenleri için nitelik erişimcileri tanımlanabiliyor

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

# Sınıf Değişkenleri

- Bir sınıf gövdesi içinde `@@var` değişkenleri sınıf kapsamında geçerli bir tür
  global değişken olarak davranır

- Sınıf değişkenleri o sınıftan miras alan tüm çocuk sınıflarca erişilebilir ve
  değiştirilebilir

- Bu "global değişken" etkisi isteniyorsa sınıf değişkenleri doğru çözümdür

- Sadece ilgili sınıfa ait bir değişken isteniyorsa "sınıf nesne değişkenleri"
  kullanılmalı

---

# Sınıf Nesne Değişkenleri

- Bir sınıf gövdesi içinde, fakat metod gövdesi dışında kullanılan `@var`
  değişkenleri nesne nitelik değişkeni **değildir**

- Bu değişkenler sınıf kapsamında anlamlı "sınıf nesnesi" değişkenleridir ve
  nadiren işe yarar

- Sınıf değişkenlerindeki "global değişken" etkisinin istenmediği durumlarda bu
  değişkenler kullanılabilir

---

# Nesne Değişkenleri

Ruby'de nesne değişkenleri miras almadan etkilenmez.

- Bu kural bir sınıftan üretilen nesnelerin nitelikleri için gayet anlaşılır

- Fakat kural "sınıf nesne değişkenleri" için de geçerli

- Sınıf nesne değişkenleri de "nesne değişkenleri"dir

- Ebeveyn sınıfın sınıf nesne değişkenleri çocuk sınıflara aktarılmaz

---

# `ARGV[0]`

- Pek çok dilden farklı olarak; `ARGV[0]` komut satırında program isminden sonra
  gelen ilk argümanı gösterir, program ismini değil

- Program ismi için `$0` değişkenini kullanın

---

# Meta Programlama

.code: rb_meta_simple_masallah/main.rb /if.+FILE.+==.+0/+1 /end/-1

---

# Meta Programlama

.code: rb_meta_simple_masallah/main.rb

<!--

TODO attrwriter'larla ilgi bilen'e gelen soru
TODO private semantiği (diğer dillerden farklı)
TODO class const inheritance semantiği (her class'ta ayrı sabit)
TODO class variable (class global) ile class instance variable
TODO class << self sentaksı, eigenclass'ı açmak
TODO new bir private metod, ayrıca factory metod trick'ine bak
TODO sembolleri biraz açıkla
TODO respond_to ve is_a? tavsiyesi
TODO case ... when String olayı

-->
