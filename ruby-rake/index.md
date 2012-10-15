# Ruby - Rake

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

[http://roktas.me/](http://roktas.me/)

Mayıs 2012

---

# Tarifler

---

# `sh`

Kabuk komutlarını `sh` ile çalıştır

    !ruby
    sh %[bir kabuk komutu]
    # sh "bir kabuk komutu"

Yönlendirme/borulama yoksa komutu dizi olarak ver

    !ruby
    sh *%w[bir kabuk komutu]
    # sh 'bir', 'kabuk', 'komutu'

Bu yöntemin başarımı daha yüksektir

---

# `sh`

Komutun çıkış kodu ve çıktısı kullanılabilir

    !ruby
    sh *%w[bir kabuk komutu] do |ok, res|
      if ok
        puts res
      else
        puts "hata: #{res.exitstatus}"
      end
    end
