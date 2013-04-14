# encoding: utf-8

require 'find'
require 'pathname'
require 'open3'
require 'set'
require 'yaml'
require 'ostruct'
require 'erb'
require 'rake/clean'

PARAMFILE = '_/param.yaml'

DEFAULTS  = {
  author: nil,
  description: nil,
  email: nil,
  url: nil,
  domain: nil,
  intro: '',
  googleanalytics: '',
  googleplus: '',
  brand: 'default',
  landslide: %x(which landslide).chomp,
  css: '_/default.css',
  js: '_/default.js',
  theme: 'light',
  indextemplate: '_/index.erb',
  foliotemplate: '_/default.erb',
}

class Hash
  def stringify
    inject({}) do |options, (key, value)|
      options[key.to_s] = value.to_s
      options
    end
  end

  def symbolize
    self.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }
  end
end

class String
  # http://stackoverflow.com/a/5638187
  def unindent
    gsub(/^#{self[/\A\s*/]}/, '')
  end
end

def colorize(text, color_code)
  "\033[1m\033[38;5;#{color_code}m#{text}\033[0m"
end

def red(text);   colorize(text, 198); end
def green(text); colorize(text, 120); end
def blue(text);  colorize(text, 117); end

def run(*cmd)
  Open3.popen3(*cmd) do |_, out_p, err_p, thr_p|
    response, error = [out_p, err_p].map { |io| io.read.strip }
    status          = thr_p.value.exitstatus
    ok              = (status == 0)

    yield ok, response, error if block_given?

    status
  end
end

def erbify(infile, outfile, variables)
  template = File.read(infile)
  File.open(outfile, 'w') do |f|
    f.write ERB.new(template)
      .result(OpenStruct.new(variables).instance_eval { binding })
  end
end

# Verilen göreceli dosya yolunu çalışma dizinine göreceli yap
def getpath(path)
  Pathname.new(path).relative? ? File.join(Rake::original_dir, path) : path
end

# Bir dizgiden etiket üret.
CONJUNCTIONS = Set.new %w(
  ve veya ama fakat yani
  ancak ya da ya da dahi
)
def labelify(string, sep = '-')
  result = []

  # Kelimelere ayırıp işle.  Öyle ki...
  string.gsub(/#{sep}/, ' ').split.each do |word|
    # hepsi küçük harf
    word.downcase!
    # noktalama işaretlerinden sonrasını sil
    word.gsub!(/[[:punct:]].*$/, '')

    # Bağlaçları pas geç.
    next if CONJUNCTIONS.include? word

    # OK
    result << word
  end

  # '-' ile birşeltir
  result.join sep
end

# Bir dizgiden başlık üret.
def titleize(string)
  result = []

  string.split.each do |word|
    word.downcase!
    result << (CONJUNCTIONS.include?(word) ? word : word.capitalize)
  end

  result.join ' '
end

# Verilen bir isim dizisinde bir sonraki ön eki belirle.
def next_prefix(names)
  names.sort.reverse.each do |name|
    if m = name.match(/^(\d+)[^-\d]+$/)
      return m[1].succ
    end
  end
  ''
end

# Türkçe karakterleri ASCII eşlerine dönüştür.
TURKISH = {
  'ı' =>  'i',
  'ğ' =>  'g',
  'ü' =>  'u',
  'ş' =>  's',
  'ö' =>  'o',
  'ç' =>  'c',
  'İ' =>  'I',
  'Ğ' =>  'G',
  'Ü' =>  'U',
  'Ş' =>  'S',
  'Ö' =>  'O',
  'Ç' =>  'C',
}
def asciify(string)
  re = Regexp.new '[' + TURKISH.keys.join + ']'
  string.gsub(re) { |c| TURKISH[c] }
end

begin
  require 'highline/import'

  def evethayir(prompt = 'Devam?', default = true)
    a = ''
    s = default ? '[E/h]' : '[e/H]'
    d = default ? 'e' : 'h'
    until %w[e h].include? a
      a = ask("#{prompt} #{s} ") { |q| q.limit = 1; q.case = :downcase }
      a = d if a.length == 0
    end
    a == 'e'
  end

  def pause(*args)
    say(*args) if args.size > 0; HighLine::SystemExtensions::get_character
  end
rescue LoadError
  highline_not_installed = true
end

#
# Folyoları 4'lü sütunlar olarak göstermek istiyoruz. Fakat CSS3'ün
# multi column spesifikasyonu tüm tarayıcılarda gerçeklenmemiş durumda.
# Örneğin 1..6 arasında isimlendirilmiş 6 adet folyomuz var.  İlgili CSS
# sınıfında column-count:4 # diyerek aşağıdaki gibi bir görüntü bekleriz.
#
# 	1 2 3 4
# 	5 6
#
# Pek çok tarayıcıda yerleşimi kontrol eden column-fill özelliği henüz
# gerçeklenmediğinden aşağıdaki gibi dengeli (balanced) yerleşimde tarama
# yapılıyor.
#
# 	1 3 5
# 	2 4 6
#
# Bu yerleşimde sadece 4'lü sütun görüntüsü kaybolmakla kalmıyor, soldan
# sağa sıralama da bozuluyor.  İmplementasyonda eksiklik olmasaydı
# öntanımlı değeri "balanced" olan "column-fill" niteliğini "auto" yaparak
# istediğimiz sonucu elde edecektik.  Bu olmadığından aşağıdaki dönüşümlerin
# yapıldığı geçici çözümü uyguluyoruz.
#
# 	[ 1 2 3 4 5 6 ] → [ 1 2 3 4 5 6 nil nil ] → [ 1 5 2 6 3 nil 4 nil ]
#
# P.S. nil değerlerini şablonda tespit ederek dolgu elemanına çeviriyoruz.
#
def pad(array, columns = 4)
  # dizi [1 2 3 4 5 6 ]
  result  = array
  # neme lazım
  return result if columns <= 0 || columns >= array.size
  # doldur →  [ 1 2 3 4 5 6 nil nil ]
  result += [nil] * (columns - array.size % columns)
  # transpozunu al → [ 1 5 2 6 3 nil 4 nil ]
  result.each_slice(columns).to_a.transpose.flatten
end

# Folyo indeksi oluştur
def index(items)
  pad(
    items.sort_by do |item|
      item[:label]
    end.map do |item|
      { label: item[:label], title: item[:title], file: item[:destination] }
    end
  )
end

# Dosya yolundan inşa bilgilerini oluştur
def itemize(path)
  {
    source: path,
    destination: path.ext('.html'),
    directory: File.dirname(path),
    label: File.dirname(path),
    title: open(path).gets.strip.sub(/^#\s+/, '').capitalize
  }
end

# Verilen bilgilere göre folyo derle
def compile(item)
  $stderr.puts blue(item[:label])

  # Komut satırını hazırla
  cmdline = [Param[:landslide]]

  [:css, :js].each do |key|
    Param[key].each do |e|
      cmdline << "--#{key}"
      cmdline << e
    end
  end

  %W[
    --embed
    --linenos no
    --theme #{Param[:theme]}
    --destination #{item[:destination]}
    #{item[:source]}
  ].each do |e|
    cmdline << e
  end

  run(*cmdline) do |ok, response, error|
    if not ok
      rm_f item[:destination]
      $stderr.puts red("landslide hatası: %s" % error)
      abort
    end
  end
end

# Yeni kurulumlarda bir ayar dosyası oluştur.
unless File.exist? PARAMFILE
  $stderr.puts(
    "Muhtemelen bu bir yeni kurulum.",
    "Ayar dosyası bulunamadı; öntanımlı bir dosya oluşturuluyor."
  )
  File.open(PARAMFILE, 'w') do |f|
    f.write(DEFAULTS.stringify.to_yaml)
  end
  $stderr.puts red("Lütfen #{PARAMFILE} dosyasını düzenleyin.")
  abort
end

# Ayarları öntanımlılarla birleştirerek yükle.
Param = DEFAULTS.clone.merge YAML.load_file(PARAMFILE).symbolize
# css ve js seçenekleri birer dizi olmalı
[:css, :js].each do |key|
  Param[key] = Param[key].is_a?(Array) ? Param[key] : Param[key].split
end

# Eksik ayarlar olabilir; kontrol et ve uyar.
unless (unconfigured = Param.keys.select { |key| Param[key].nil? }).empty?
  $stderr.puts red(
    "Lütfen #{PARAMFILE} dosyasında aşağıdaki parametreleri girin:"
  ), "  #{unconfigured}"
  abort
end

# Landslide (uygun sürümde) kurulu olmalı.
if  File.exist? Param[:landslide]
  unless %x(#{Param[:landslide]} --version 2>/dev/null).match(/patched/)
    $stderr.puts(
      red("Sisteminizde hatalı bir landslide sürümü kurulu."),
      red("Lütfen python-landslide-patched paketinin son sürümünü kurun.")
    )
    abort
  end
else
  $stderr.puts red("#{Landslide} bulunmadı.")
  abort
end

# Css ve Js dosyaları zorunlu değil.
[Param[:css], Param[:js]].each do |files|
  files.each do |f|
    unless File.exists? f
      touch f
      $stderr.puts red("Eksik #{f} dosyası oluşturuldu.")
    end
  end
end

# Folyo dizinlerini tara ve ögeleri belirle.
Items = []
FileList['[^_.]*'].select { |path| FileTest.directory?(path) }.each do |dir|
  Find.find(dir) do |path|
    basename = File.basename(path)
    if FileTest.directory?(path)
      Find.prune if %w(. _).any? { |prefix| basename[0] == prefix }
    elsif basename == 'index.md' && File.open(path, &:readline).start_with?('#')
      Items << itemize(path)
    end
  end
end

# Her öge için bir file görevi oluştur.
Items.each do |item|
  file item[:destination] => [
    item[:source],
    *Param[:css],
    *Param[:js],
    *FileList["#{item[:directory]}/media/*"], # media files, i.e. images
    *FileList["#{item[:directory]}/code/*"],  # code files
    Param[:landslide]
  ] do
    compile(item)
  end
end

# Hedefler elimizin altında bulunsun.
destinations = Items.map { | item| item[:destination] }

desc 'Folyoları derle.'
task :build => destinations
CLEAN.include destinations

file 'index.html'=> [PARAMFILE, Param[:indextemplate], *destinations] do
  $stderr.puts green('index')

  Param[:items] = index(Items)

  erbify(Param[:indextemplate], 'index.html', Param)
end

desc 'Bir folyo derle.'
task :compile, :path do |t, args|
  if args[:path]
    compile(itemize(getpath(args[:path])))
  else
    $stderr.puts red("Kullanım: rake compile[<dosya yolu>]")
    abort
  end
end

desc 'Folyoları indisle.'
task :index => 'index.html'
CLEAN.include 'index.html'

desc 'Dosya görüntüle (öntanımlı olarak indis).'
task :view, :path do |t, args|
  path = if args[:path]
    itemize(getpath(args[:path]))[:destination]
  else
    'index.html'
  end
  unless File.exists? path
    $stderr.puts red("#{path} dosyası bulunamadı; dosyayı derlediniz mi?")
    fail
  end
  sh "xdg-open #{path} >/dev/null"
end

desc 'Yeni folyo.'
task :new do
  # Bu görevde highline kullanıyoruz.
  if highline_not_installed
    $stderr.puts "Lütfen highline gem paketini kurun."
    abort
  end

  label, title = nil, nil

  # Folyoları sıralamak için numara kullanmış olabiliriz.
  # Bir sonraki sayıyı belirle
  prefix = next_prefix(Items.map { |item| item[:label] })

  # Uzun başlıklardan kaçınalım.
  max = Param[:maxtitlelength] || 24

  loop do
    ans = ask("Başlık? [konuyu özetleyen birkaç kelime girin] ")

    break if ans.nil? || ans.strip.empty?

    # Numaralandırma varsa ön ek olarak bir sonraki sayı.
    label = prefix + asciify(labelify(ans))
    title = titleize(ans)

    break unless evethayir("#{label} isminde bir dizin açılacak.  Devam?")

    if Dir.exists?(label)
      $stderr.puts red("#{label} isminde bir dizin zaten var.")
    elsif max >= 0 && label.length > max
      $stderr.puts red("Daha kısa bir başlık kullanmalısınız.")
    else
      break
    end

    $stderr.puts red("Lütfen tekrar deneyin.")
  end

  if label
    puts
    puts <<-EOF.unindent
      Şimdi #{label}/index.md kaynak dosyası düzenlenecek.

      Aşağıdaki dizin düzenine uymanızı öneririz:

      - Folyoda kullanılan resimler  → #{label}/media
      - Folyoda yer alan uzun kodlar → #{label}/code

      Lütfen düzenlemeniz tamamlandıktan sonra folyoyu derlemeyi ve
      #{label} dizinini depoya eklemeyi unutmayın

          $ rake
          $ git add #{label}
          $ git commit #{label} -m "Yeni folyo #{label}"
          $ git push --all

      Devam etmek için herhangi bir tuşa basın...
    EOF
    puts
    pause

    # Her şey tamamsa dizin düzenini kur.
    mkdir(label)

    source = "#{label}/index.md"
    destination = source.ext(".html")

    touch destination
    Param[:foliotitle] = title
    erbify(Param[:foliotemplate], source, Param)

    # Düzenlemeye gir.
    sh ENV['EDITOR'], source
  end
end

desc "Güncelle."
task :update do
  if %x(git config remote.upstream.url).chomp.empty? &&
     %x(git config remote.origin.url).chomp !~ %r{[:/]roktas/fo.git}
    sh "git remote add upstream git://github.com/roktas/fo.git"
    sh "git pull --no-edit upstream master"
  end
  sh "sudo sh -c 'apt-get update && apt-get install python-landslide-patched'"
  Rake::Task["default"].invoke
end

task :default => [:build, :index]
