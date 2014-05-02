#   Ruby - Tarifler

.fx: first

Recai Oktaş `<roktas@bil.omu.edu.tr>`

http://roktas.me/

Mart 2012

#   `*` atamaları

`*` işleciyle atama yap

        !ruby
        a, b, c = *('A'..'C')
        a #=> 'A'
        b #=> 'B'
        c #=> 'C'

        match, text, number = *"Something 981".match(/([A-z]*) ([0-9]*)/)
        match  #=> "Something 981"
        text   #=> "Something"
        number #=> "981"

#   Düzenli ifade eşleşmeleri

Düzenli ifadelerde eşleşmeleri topla

        !ruby
        email = "Fred Bloggs <fred@bloggs.com>"
        email[/<(.*?)>/, 1] #=> "fred@bloggs.com"

        string = 'this is a test'
        string[/[aeiou].+?[aeiou]/] #=> 'is i'

#   Dizi değerlerinden değişkene

Heterojen bir diziden eleman seç

        !ruby
        (a, b), c, d = [ [:a, :b ], :c, [:d, :f] ]
        a #=> :a
        b #=> :b
        c #=> :c
        d #=> [:d, :f]

#   İlklendirmemiş ataması

Değişken ilklendirmesini atlayarak atama yap

        !ruby
        (a ||= []) << 'test'

#   İlklendirmeler

Değişken *ilklendirilmemişse* ilkle

        !ruby
        path ||= "/usr/bin"
        # unless path then path = "/usr/bin"

Değişken *ilklendirilmişse* ekle

        !ruby
        string &&= string + "suffix"
        # if string then string = string + "suffix"

#   Tekil veya çoğul değerden döngü

Tekil veya çoğul (dizi) değeri alabilecek bir değişkenle döngü kur

        !ruby
        [*v].each do |item|
        # ...
        end

#   Satır içi `and` ve `or`

`and` ve `or` tek satırlıkları

        !ruby
        queue = []
        %w{hello x world}.each do |word|
          queue << word and puts "Added to queue" unless word.length <  2
        end
        queue
        #=> Added to queue
        #=> Added to queue
        #=> ["hello", "world"]

#   `case` deyimlerinde `Proc`

`case` deyimlerinde `Proc` kullanılabilir (Ruby 1.9'da `Proc#===` ile
`Proc#call` eşdeğerdir)

        !ruby
        def multiple_of(factor)
          Proc.new { |product| product.modulo(factor).zero? }
        end

        case number
        when multiple_of(3)
          puts "Multiple of 3"
        when multiple_of(7)
          puts "Multiple of 7"
        end

#   Dizi ilkleme

Aralık kullanarak dizi ilkle

        !ruby
        numbers = *(0..5)
        #=> [0, 1, 2, 3, 4, 5]

Veya

        !ruby
        numbers = (0..5).to_a
        #=> [0, 1, 2, 3, 4, 5]

#   İki diziden sözlük üretimi

Eşboyutlu iki diziden sözlük üret

        !ruby
        keys = [:x, :y, :z]
        values = [123, 456, 789]

        Hash[keys.zip(values)]
        #=> {x: 123, y: 456, z: 789}

#   Sözlükten dizi üretimi

Sözlükten "anahtar, değer" çiftleri dizisi üret

        !ruby
        h = { name: "Fred", age: 93, gender: :male }
        [*h]
        #=> [[:name, "Fred"], [:age, 93], [:gender, :male]]

#   Dizi veya sözlükten değerler seçmek

Dizi veya sözlükten değerler seç

        !ruby
        a = %w{a b c d e f g h}
        required = [0, 5, 6]
        a.values_at(*required)
        #=> ["a", "f", "g"]

        h = { name: "Fred", age: 93, gender: :male }
        required = [:age, :name]
        h.values_at(*required)
        #=> [ 93, "Fred" ]

#   Diziden sözlük üretimi

Çift sayıda elemana sahip bir diziden sözlük oluştur

        !ruby
        fruit = [ "apple","red","banana","yellow" ]
        #=> ["apple", "red", "banana", "yellow"]

        Hash[*fruit]
        #=> {"apple"=>"red", "banana"=>"yellow"}

#   Nesne niteliklerinden diziye

Bir nesne dizisindeki niteliklerden dizi oluştur

        !ruby
        shapes = []
        shapes << Rectangle.new 3, 5
        shapes << Square.new 4
        shapes << Circle.new 7

        areas = shapes.map(&:area)

#   Öntanımlı sözlük değerleri

Sözlük değerlerini öntanımlı olarak ayarla

        !ruby
        parties = Hash.new { |hash, key| hash[key] = [] }
        parties["Summer party"]
        #=> []

        parties["Summer party"] << "Joe"
        #=> {"Summer party"=> ["Joe"]}
        parties["Other party"] << "Jane"
        #=> {"Summer party"=>["Joe"], "Other party"=>"Jane"}

#   Sözlük argümanları

Metodlarda son argüman sözlük ise kıvrık parantez gerekmez

        !ruby
        def dump(h)
          puts h[:name], h[:age]
        end

        dump(name: 'Fred', age: 93)

Veya

        !ruby
        dump name: 'Fred', age: 93

#   Küme

Yapısı diziye, başarımı sözlüğe benzer bir veriyapısı: "küme"

        !ruby
        set = Set.new %w(foo bar baz)

Hızlı aramalar için sözlüğe yakın bir başarıma sahip

        !ruby
        set.include? 'foo'
        #=> true

#   Metod gövdelerinde `rescue`

Metod gövdelerinde `rescue` bloklarını `begin`, `end` kullanmadan yaz

        !ruby
        def func
        begin
          # ...
        rescue
          # ...
        end
        end

Yerine

        !ruby
        def func
          # ...
        rescue
          # ...
        end

#   Satır içi `rescue`

`rescue` tek satırlığı

        !ruby
        h = { :age => 10 }
        h[:name].downcase                         #=> ERROR
        h[:name].downcase rescue "No name"        #=> "No name"

#   İstisnanın geri takibi

Hata ayıklamada üretilen istisnayı geri takip et

        !ruby
        def do_division_by_zero; 5 / 0; end

        begin
          do_division_by_zero
        rescue => exception
          puts exception.backtrace
        end

#   Ebeveyn metodda değişiklik

Ebeveyn metodda minör değişiklik

        !ruby
        def hello(*)
          super
          puts "hello!"
        end

`hello` metodunun argümanlarını bilmek gerekmiyor

#   Hem program hem modül

Betiğin hem program hem de modül olarak davranabilmesini sağla

        !ruby
        # module

        if __FILE__ == $PROGRAM_NAME
          # program
        end

#   Gerçel sayı biçimlendirmesi

Gerçel sayıları biçimle

        !ruby
        money = 9.5
        "%.2f" % money #=> "9.50"

#   Kaynakça

[Stackoverflow](http://stackoverflow.com/questions/63998/hidden-features-of-ruby)

[Ruby Tricks](http://www.rubyinside.com/21-ruby-tricks-902.html)
