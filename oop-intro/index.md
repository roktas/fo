#   NYP - Giriş

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

http://r.oktas.us/

Ocak 2012

#   Bir "nokta"nın hikayesi...

![Nokta](media/point.png)

#   NYP

1.  Veri Sarmalama

2.  Miras Alma

3.  Çok Biçimlilik

#   C

#   Yapı

.code: code/c_struct_simple_point/main.c


#   C++

#   Sınıf

.code: code/cpp_class_simple_point/main.cpp

#   Ruby

#   Ruby

[http://www.ruby-lang.org/tr/downloads/](http://www.ruby-lang.org/tr/downloads/)

#   Ruby

.code: code/rb_class_simple_point/main1.rb

#   Sınıf

.code: code/rb_class_simple_point/main.rb

#   İşleç Yüklemesi

.code: code/rb_class_overloading_point/main.rb

#   Sınıf Metodları

.code: code/rb_class_classmethod_point/main2.rb

#   Sınıf Metodları

.code: code/rb_class_classmethod_point/main1.rb

#   Sınıf Metodları

.code: code/rb_class_classmethod_point/main.rb

#   Miras Alma

.code: code/rb_inheritance_simple_circle/main2.rb

#   Miras Alma

.code: code/rb_inheritance_simple_circle/main1.rb

#   Miras Alma

.code: code/rb_inheritance_simple_circle/main.rb

#   Çok Biçimlilik

.code: code/rb_polymorphism_simple_shape/main.rb

#   Çok Biçimlilik

Çok Biçimlilik
:    Bir isim → Çok biçim

-   Bir isim: `area`

-   Çok biçim: `shape` nesneleri `area` mesajına farklı şekilde cevap veriyor

#   Çok Biçimlilik

Diğer bir çok biçimlilik örneği

        !javascript
        var these = [19, "19"];
        var those = [];
        for (var i = 0; i < these.length; i++)
               those.push(these[i] + 1);
        // those = [20, "191"]


-   JavaScript'te `+` operatörü çokbiçimli davranıyor

-   Dizideki güncel nesne eğer:

    +   tamsayı ise toplama yapıyor

    +   dizgi ise tamsayıyı dizgiye çevirip ekleme yapıyor

#   Çok Biçimlilik

Çok Biçimlilik'te

-   Sadece davranış ismiyle ilgileniyoruz → `area`

-   Davranışı sergileyen nesnelere ortak bir isim veriyoruz →  `shape` (şekil)

-   Nesnenin kimliğini ayrıntılı bilmemiz gerekmiyor → `Circle`, `Square`

#   Dinamik Dağıtım

Bir kargo merkezi ve kargo paketleri

-   Kargo paketleri nasıl **dağıtılır**?

-   Paketin hangi yolla (hava, kara, deniz) gönderileceğine karar vermek lazım

-   Alıcı adrese göre yöntem değişir

**Cargo Dispatch**

-   Alıcı adrese bak

-   Ulaşım yöntemini tayin et

-   Tek isim → `send`, çok biçimli davranış → farklı ulaşım yöntemleri

#   Dinamik Dağıtım

-   Şekil nesneleri arasında dolaşıyor ve `area` metodunu çalıştırıyoruz

-   `area`'nın hangi gerçeklemesi çalıştırılacak?

-   İlgili nesnenin sınıfı neyse o sınıfta tanımlı metod çalıştırılacak

-   Ama ilgili nesnenin sınıfını bilmemiz gerekmiyor

-   Uygun `area` gerçeklemesine çalışma zamanında karar veriliyor

#   Dinamik Dağıtım

-   Kargo paketi nasıl gönderilecek? `send` metodu

-   Şekil nesnesinin alanı nasıl hesaplanacak? `area` metodu

-   Karar anında bir tür dağıtım (**dispatch**) yapılıyor

-   Bu karar çalışma zamanında veriliyor

-   Dinamik dağıtım → **dynamic dispatch**

#   Arayüz

-   Vana/vida → açma/kapama

-   Arabalar → direksiyon, vites sistemi

-   Telefon → kulaklık/mikrofon, tuş takımı

-   USB standartı → Aygıtlar, USB soketleri

#   Arayüz

-   İç yapısı (gerçeklemesi) farklı olabilen nesnelerle haberleşmemizi sağlıyor

-   Bir tür sözleşme

    +   Vanayı saat yönünün tersine çevirerek akışı kes

    +   Aracın kalkışında debriyaj, 1'nci vites, gaz

    +   Telefonda arama yapmak için 4 + 7 haneli numarayı tuşla/çevir

    +   USB aygıtı kullanmak için aygıtı USB soketine tak

-   Nesneleri arayüzler üzerinden kullanıyoruz

-   Arayüzler aynı, gerçeklemedeki farklı olabilir

#   Arayüz ve Çok Biçimlilik

Arayüz ve Çok biçimlilik birbiriyle yakından ilintili

-   Çok biçimlilik → bir isim, çok biçim

-   İsim → arayüzde tanımlanan bir sözleşme maddesi

-   Biçim → ilgili arayüzün (o sınıf için) gerçeklemesi


#   Python

#   Sınıf

.code: code/py_class_simple_point/main.py

#   İşleç Yüklemesi

.code: code/py_class_overloading_point/main.py

#   Sınıf Metodları

.code: code/py_class_classmethod_point/main1.py

#   Sınıf Metodları

.code: code/py_class_classmethod_point/main.py

#   Miras Alma

.code: code/py_inheritance_simple_circle/main1.py

#   Miras Alma

.code: code/py_inheritance_simple_circle/main.py

#   Çok Biçimlilik

.code: code/py_polymorphism_simple_shape/main.py

#   Kartlar


🂡       🂱       🃁       🃑
🂢       🂲       🃂       🃒
🂣       🂳       🃃       🃓
🂤       🂴       🃄       🃔
🂥       🂵       🃅       🃕
🂦       🂶       🃆       🃖
🂧       🂷       🃇       🃗
🂨       🂸       🃈       🃘
🂩       🂹       🃉       🃙
🂪       🂺       🃊       🃚
🂫       🂻       🃋       🃛
🂬       🂼       🃌       🃜
🂭       🂽       🃍       🃝
🂮       🂾       🃎       🃞


#   Dil Karşılaştırmaları

[http://hyperpolyglot.org/scripting](http://hyperpolyglot.org/scripting)
