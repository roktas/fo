#!/usr/bin/ruby
# encoding: utf-8
#
# Kart denemeleri
#
# Bu programı çalıştıracağınız konsolda kullanılan sabit genişlikli
# fontlar http://en.wikipedia.org/wiki/Playing_cards_in_Unicode
# şekillerini desteklemelidir.  Örneğin Terminus fontunda (19/x'in öntanımlı
# fontu) bu destek **yoktur**, fakat GNOME uçbirimi ile gelen öntanımlı
# font bu şekilleri destekler.

require 'forwardable'

module Cards
  SUITES = %w(club diamond heart spade).map(&:to_sym)
  RANKS  = %w(1 2 3 4 5 6 7 8 9 j q k).map(&:to_sym)
  GLYPH = {
    s1:  "\u{1f0a1}", h1:  "\u{1f0b1}", d1:  "\u{1f0c1}", c1:  "\u{1f0d1}",
    s2:  "\u{1f0a2}", h2:  "\u{1f0b2}", d2:  "\u{1f0c2}", c2:  "\u{1f0d2}",
    s3:  "\u{1f0a3}", h3:  "\u{1f0b3}", d3:  "\u{1f0c3}", c3:  "\u{1f0d3}",
    s4:  "\u{1f0a4}", h4:  "\u{1f0b4}", d4:  "\u{1f0c4}", c4:  "\u{1f0d4}",
    s5:  "\u{1f0a5}", h5:  "\u{1f0b5}", d5:  "\u{1f0c5}", c5:  "\u{1f0d5}",
    s6:  "\u{1f0a6}", h6:  "\u{1f0b6}", d6:  "\u{1f0c6}", c6:  "\u{1f0d6}",
    s7:  "\u{1f0a7}", h7:  "\u{1f0b7}", d7:  "\u{1f0c7}", c7:  "\u{1f0d7}",
    s8:  "\u{1f0a8}", h8:  "\u{1f0b8}", d8:  "\u{1f0c8}", c8:  "\u{1f0d8}",
    s9:  "\u{1f0a9}", h9:  "\u{1f0b9}", d9:  "\u{1f0c9}", c9:  "\u{1f0d9}",
    s10: "\u{1f0aa}", h10: "\u{1f0ba}", d10: "\u{1f0ca}", c10: "\u{1f0da}",
    sj:  "\u{1f0ab}", hj:  "\u{1f0bb}", dj:  "\u{1f0cb}", cj:  "\u{1f0db}",
    sq:  "\u{1f0ad}", hq:  "\u{1f0bd}", dq:  "\u{1f0cd}", cq:  "\u{1f0dd}",
    sk:  "\u{1f0ae}", hk:  "\u{1f0be}", dk:  "\u{1f0ce}", ck:  "\u{1f0de}",
  }

  # Kart
  class Card
    include Comparable

    attr_reader :suite, :rank, :symbol

    def initialize(suite, rank)
      @suite = suite.to_s.to_sym
      raise "Bad suite: #{suite}" unless SUITES.include?(@suite)

      @rank = rank.to_s.to_sym
      raise "Bad rank: #{rank}"   unless RANKS.include?(@rank)

      @symbol = "#{@suite[0]}#{@rank}".to_sym
    end

    def rank_value
      RANKS.index(@rank)
    end

    def suite_value
      SUITES.index(@suite)
    end

    def to_i
      rank_value
    end

    # Kartları Unicode karakterlerle görüntülüyoruz
    def to_s
      GLYPH[@symbol]
    end

    # Sıralamada önemli
    def <=>(other)
      # Bu metodun üzerine yazmak yerine suit değerleri değiştirilebilir
      if self.suite_value == other.suite_value
        self.rank_value <=> other.rank_value
      else
        self.suite_value <=> other.suite_value
      end
    end
  end

  # Deste (deck) ve El (hand) için baz sınıf
  class Cards
    extend Forwardable
    # Deste (deck) ve El (hand) temelde birer dizi (@cards)
    def_delegators :@cards,:push, :pop, :shuffle, :shuffle!, :sort, :sort?, :empty?, :size

    def to_s
      @cards.map(&:to_s).join(' ')
    end
  end

  # Deste
  class Deck < Cards
    # Kart şablonunu nesne oluşturulurken değil sınıf ilklenirken hazırla
    CARDS = SUITES.product(RANKS).map { |c| Card.new(*c) }
    # Öntanımlı el kaç kart?
    DEFAULT_HAND_SIZE = 4

    def initialize
      # Klonlama kart şablonunu her nesnede hazırlamaktan daha iyi
      @cards  = CARDS.clone
    end

    # Desteden el çıkar
    def hand(n = nil)
      @last_hand_size = n if n
      Hand.new(@cards.pop(@last_hand_size || DEFAULT_HAND_SIZE))
    end
  end

  # El
  class Hand < Cards
    def initialize(cards)
      @cards = cards
    end

    def deal
      @cards.pop
    end
  end
end

# Test sürüşü
if __FILE__ == $0
  include Cards

  # Yeni deste
  d = Deck.new
  # Desteyi karıştır
  d.shuffle!
  # Desteden eller
  until (h = d.hand).empty?
    puts h
    # Ellerden tek kart
    while c = h.deal
      puts c
    end
  end

  # Kart karşılaştır
  puts Card.new("spade", "j") < Card.new("diamond", "k")
end
