# İlk sürüm

sayilar = [23, 46, -72, 32]

enbuyuk = sayilar[0]

i = 1
while i < sayilar.size
  if sayilar[i] > enbuyuk
    enbuyuk = sayilar[i]
  end
  i += 1
end

puts enbuyuk
