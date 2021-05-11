##Tuesday, January 26, 2021
## aAcademy > Object-Oriented-Programming > Poker
##Luciano A. Campos


require_relative './poker_hands'

class Hand
    include PokerHands

    attr_reader :cards

    def initialize(cards)
        raise "Must have five cards" unless cards.count == 5
        @cards = cards.sort
    end

    def self.winner(hands)
        hands.sort.last
    end

    def trade_cards(old_cards, new_cards)
        raise "Must Have five cards" unless old_cards.count == new_cards.count 
        raise "Cannot discart unowned card" unless has_cards?(old_cards)
        take_cards(new_cards) && discart_cards(old_cards) && sort!
        old_cards
    end

    def to_s
        cards.join(' ')
    end

    private

    def sort!
        @cards.sort!
    end

    def take_cards(cards)
        @cards.push(*card)
    end

    def discart_cards(old_cards)
        old_cards.each { |card| cards.delete(card) }
    end

    def has_cards?(old_cards)
        old_cards.all? { |card| cards.include?(card) }
    end

end
