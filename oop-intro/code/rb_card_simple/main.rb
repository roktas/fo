#!/usr/bin/ruby
# encoding: utf-8
#
# Kart denemeleri
#
# Bu programı çalıştıracağınız konsolda kullanılan sabit genişlikli
# fontlar http://en.wikipedia.org/wiki/Playing_cards_in_Unicode
# şekillerini desteklemelidir.  Örneğin Terminus fontunda (19/x'in öntanımlı
# fontu) bu destek **yoktur**, fakat GNOME ile gelen öntanımlı font bu
# şekilleri destekler.

class Card
  include Comparable

  SUITES = %w(spade heart diamond club).map(&:to_sym)
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

  attr_reader :suite, :rank, :symbol

  def initialize(suite, rank)
    @suite = suite.to_s.to_sym
    raise "Bad suite: #{suite}" unless SUITES.include?(@suite)

    @rank = rank.to_s.to_sym
    raise "Bad rank: #{rank}"   unless RANKS.include?(@rank)

    @symbol = "#{@suite[0]}#{@rank}".to_sym
  end

  def to_i
    RANKS.index(@rank)
  end

  def to_s
    GLYPH[@symbol]
  end

  def <=>(another)
    self.to_i <=> another.to_i
  end
end

class Deck
  def initialize(no_shuffle = false)
    @deck = []
    Card::SUITES.product(Card::RANKS).each do |c|
      @deck << Card.new(*c)
    end
    shuffle! unless no_shuffle
  end

  def shuffle!
    @deck.shuffle!
  end

  def to_s
    @deck.map(&:to_s).join(' ')
  end

  def hands(n = 4)
    @deck.each_slice(n)
  end

  def show(n = 4)
    hands(n).map do |h|
      h.map(&:to_s).join(' ')
    end.join("\n")
  end
end

puts Card.new("spade", "j") < Card.new("diamond", "k")

puts Deck.new.show
