#   Node - Giriş

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

http://roktas.me/

Mart 2012

---

#   Geliştirme Ortamı Kurulumu

*   Npm dışındaki temel paketleri kur:

        !sh
        $ sudo apt-get install nodejs coffeescript libjs-coffeescript

*   Debian'da coffeescript paketi, cakephp paketi ile birlikte gelen `cake` ile
    çakışıyor.

*   Bu nedenle coffeescript ile gelen `cake`, `cake.coffeescript` olarak
    isimlendirilmiş.

*   cakephp kullanmıyorsanız aşağıdaki sembolik bağ düzenlemesini yap.

        !sh
        $ sudo ln -s /usr/bin/cake.coffeescript /usr/bin/cake

---

#   Geliştirme Ortamı Kurulumu

*   Npm'i özel olarak kur:

        !sh
        $ wget -qO- http://npmjs.org/install.sh | sudo sh

İsteğe bağlı olarak:

*   Npm paketi yayımlamak için geliştirici hesabı ekle:

        !sh
        $ npm adduser

    Kullanıcı adının (`Username`) münkünse Unix sistemlerde her zaman
    kullandığınız ad olmasına dikkat edin.

---

#   İlk Uygulama

*   Depo oluştur

        !sh
        $ read -p "Github hesabı? " ACCOUNT
        $ read -p "Uygulama adı? " APP
        $ echo "$APP deposunu Github hesabınızda oluşturun"

*   Depoyu ilkle

        !sh
        $ mkdir $APP
        $ git init
        $ echo "node_modules" >>.gitignore
        $ touch README.md

---

#   İlk Uygulama

*   Dizin kökünde `server.js`'i oluştur

        !sh
        $ cat >server.js<<-EOF
        var http = require('http');

        var server = http.createServer(function (req, res) {
             res.writeHead(200, { "Content-Type": "text/plain" })
             res.end("Hello world\n");
        });

        server.listen(process.env.PORT || 8001);
        EOF

*   Depoyu gönder

        !sh
        $ git add .
        $ git commit -a -m ilk
        $ git remote add origin git@github.com/$ACCOUNT/$APP
        $ git push origin master

---

#   CoffeeScript Kullanımı

*   Dizin kökünde (`server.js`) yerine `server.coffee`'yi, oluştur

        !sh
        $ cat >server.coffee<<-EOF
        http = require 'http'

        http.createServer (req, res) ->
          res.writeHead 200,
            'Content-Type': 'text/plain'
          res.end "Hello world!"
        .listen(process.env.PORT || 8081)
        EOF

*   `package.json`'a coffeescript bağımlılığını ekle

        !javascript
        "dependencies": { ..., "coffee-script": "~1.2" }

*   `package.json`'da uygulama kurulduktan sonra derleme yapılmasını iste

        !javascript
        "postinstall": "coffee -b -c ."

---

#   Npm Paket Yönetimi

*   Node uygulamasının bağımlılıklarını `package.json` dosyasında
    `"dependencies"` anahtarında tutuyoruz.

        !javascript
        "dependencies": { "coffee-script": "~1.2" },

*   Paketleri yerelde kurmak ve `package.json`'a eklemek için:

        !sh
        $ npm install coffee-script --save

*   Paketler uygulama dizinine `node_modules` dizinine kuruluyor.  Bu dizini
    `.gitignore`'a eklemeyi unutmayın:

        !sh
        $ echo /node_modules/ >>.gitignore

Bk. [Npm dokümanları](http://npmjs.org/doc/json.html)

---

#   Joyent

---

#   Joyent

Node'ı geliştirenler (Joyent) tarafından sunulan bir barındırma hizmeti.

*   İşletim sistemi olarak Solaris kullanılıyor

*   Kabuk erişimi yapılabilir; 5 GiB disk, 128 MB bellekli sanal makineler

*   Sanal makineler `*.no.de` isim uzayında

*   Uygulama deposu sanal makine ev dizininde `repo` altında

*   Npm bağımlılıkları her git gönderiminde otomatik olarak yönetiliyor

*   Npm dışındaki yazılımlar Solaris'e özgü `pkgin` paket yöneticisi ile
    kuruluyor

*   Maksimum 5 adet veritabanı oluşturulabiliyor (MySQL, PostgreSQL, MongoDB vb)

---

#   Başlangıç

*   Kayıt ol: http://no.de

*   SSH anahtarı yükle

*   Yeni makine iste: Servis çok yüklüyken hemen makine verilmeyebilir.
    Aralıklarla bir kaç kez istemek gerekiyor.  Makine adını bu dokümanda
    `JOYENT` değişkeninde tutuyoruz.

        !sh
        $ read -p "Makine adı (örnek 'foo.no.de')? " JOYENT

*   Yerelde SSH ayarlarını yap

        !sh
        $ cat >>~/.ssh/config <<-EOF
        Host $JOYENT
                HostName $JOYENT
        	    Port 62420
        	    User node
        	    ForwardAgent yes
        EOF

---

#   Başlangıç

*   SSH girişini ayarla

        !sh
        $ ssh-copy-id $JOYENT

*   Test et

        !sh
        $ ssh $JOYENT

*   Depoyu hazırla

        !sh
        $ echo "node-service" >>.gitignore
        $ git commit .gitignore -m "gitignore Joyent"

---

#   Başlangıç

*   Depoyu ayarla (hub gibi git alias'ları etkin olabileceğinden git için açık
    yol verildi)

        !sh
        $ /usr/bin/git remote add joyent $JOYENT:repo

*   Uygulamayı konuşlandır

        !sh
        $ git push joyent master

Bk. [Joyent dokümanları](http://wiki.joyent.com/display/node/Getting+Started+with+a+Node.js+Development+SmartMachine)

Bk. [İlk Node uygulaması](http://roktas.me/FIXME)

---

#   Npm paketleri nasıl yönetiliyor?

Joyent beklenildiği gibi `package.json`'daki değişiklikleri her gönderimde
etkinleştiriyor ve npm ile eksik paketleri kuruyor.

---

#   Node sürümünü nasıl ayarlıyoruz?

Joyent'te kullanılacak Node sürümünü `config.json` dosyasında `{ "version":
"v0.6.12" }` şeklinde belirtebilirsiniz.

*   Halihazırda `version` dışındaki anahtarlar dikkate alınmıyor.

*   Yereldeki testlerle Joyent'teki testlerin eşgüdümlü olmasını sağlamak için
    sürüm numarasının yerelde kullandığınız Node ile uyumlu olmasına dikkat
    edin.

*   Joyent'te kullanılabilir Node sürümlerini öğrenmek için:

        !sh
        [joyent]$ cat /opt/nodejs/NODE-BUILDS


Bk. [Joyent dokümanları](http://wiki.joyent.com/display/node/Setting+the+Node.js+Version)

---

#   Uygulama nasıl ayarlanıyor?

*   Uygulama ayarları için `node-service/profile` dosyası kullanılıyor.

*   Örneğin `GITHUB_API_KEY` gibi bir değişkeni bu bu dosyaya ekleyin:

        GITHUB_API_KEY='...'

*   Daha sonra uygulamada bu değişkene şu şekilde ulaşın:

        !javascript
        key = process.env.GITHUB_API_KEY;

---

#   Ekstra yazılımları nasıl kuruyoruz?

*   Uygulamaların ihtiyaç duyacağı (npm paketleri dışındaki) yazılımları `pkgin`
    ile kuruyoruz (`sudo` hakkı gerekmiyor).

*   Örneğin Redis'i kurmak için:

        !sh
        [joyent]$ pkgin install redis

*   Örneğin Ruby'yi (sürüm 1.9) kurmak için:

        !sh
        [joyent]$ pkgin install ruby19-base

Bk. [Joyent dokümanları](http://wiki.joyent.com/display/node/Node.js+SmartMachine+FAQ)

---

#   Servis günlüğünü nasıl görüyoruz?

*   Sanal makineye girerek:

        !sh
        [joyent]$ node-service-log

*   Veya yerelde:

        !sh
        $ ssh $JOYENT node-service-log

---

#   Servis günlüğünü nasıl görüyoruz?

*   Depo kökünde aşağıdaki içerikte bir `Cakefile` oluşturun

        !coffeescript
        HOST  = '...' # Sunucu
        LINES = 40    # Kaç satır?

        runcmd = (cmd) ->
          {exec}  = require 'child_process'
          exec cmd, (err, stdout, stderr) ->
            throw err if err
            console.log stdout + stderr

        task 'log', 'sunucu günlüğünü görüntüle', ->
          runcmd(
            "ssh #{HOST} tail -n #{LINES} " +
            "/var/svc/log/site-node-service:default.log"
          )

*   Artık SSH ile uzak makineye geçerek işlem yapmak yerine

        !sh
        $ cake log

---

#   Uçbirim düzgün değil?

Yereldeki `TERM` ortam değişkeninin etkin olmamasını sağlayın

*   Sanal makineye girerek:

        !sh
        [joyent]$ echo "TERM=xterm-color" >>~/.ssh/environment

---

#   `sudo` nasıl?

*   Sanal makineye `admin` olarak girin

        !sh
        $ ssh admin@$JOYENT

*   `node` kullanıcısını `sudoers`a ekleyin (aşağıdaki satır gibi olmalı)

        !sh
        User_Alias ADMINS = admin,node
