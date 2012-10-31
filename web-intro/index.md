#   Web - Giriş

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

http://roktas.me/

Nisan 2012

---

#   CSS

---

#   Kurallar

CSS dosyaları "kurallar"dan ("rules") oluşuyor

        <seçici> {
                özellik: değer;
        }

---

#   Seçiciler

Seçici ("selector") bir tip, sınıf veya id seçiyor

*   Tip seçici: `p` etiketlerini yani paragrafları seç

        !css
        p {
          ...
        }

*   Sınıf ("class") seçici: `foo` sınıflı elemanları seç

        !css
        .foo {
          ...
        }

*   Id ("id") seçici: `baz` id'li elemanları seç

        !css
        #baz {
          ...
        }

---

#   Seçiciler

Birden fazla seçiciyi virgülle gruplayarak tek bir kural oluşturabiliyoruz

*   `foo` ve `bar` sınıflarını (her ikisini) seç ve font boyutunu `16px` olarak
    ayarla

        !css
        .foo, .bar {
          font-size: 16px;
        }

Soldan sağa sırayla seçiciyi özelleştirmek mümkün

*   `foo` sınıfı içindeki **tüm** `bar` sınıflı elemanlar içindeki **tüm**
    paragrafları seç ve font boyutunu `16px` olarak ayarla

        !css
        .foo .bar p {
          font-size: 16px;
        }

---

#   Seçiciler

Seçicilerle gruplama yapmak dışında çeşitli kombinasyonlar da kurulabiliyor

*   Sırasız listelerdeki tüm maddelerin metin rengini kırmızı yap

        !css
        ul li { color: red; }

*   Sırasız listelerde ilk seviye maddelerin metin rengini kırmızı yap

        !css
        ul > li { color: red; }

*   Sırasız listelerden sonra gelen ilk paragrafların metin rengini kırmızı yap

        !css
        ul + p { color: red; }

*   Sırasız listelerden sonra gelen **tüm** paragrafların metin rengini kırmızı
    yap

        !css
        ul ~  p { color: red; }

---

#   Kural Öncelikleri

TODO

---

#   Sınıf mı, Id mi?

TODO

---

#   Seçiciler

[Daha fazlası](http://net.tutsplus.com/tutorials/html-css-techniques/the-30-css-selectors-you-must-memorize/)

---

#   HTML

---

#   JavaScript

---
