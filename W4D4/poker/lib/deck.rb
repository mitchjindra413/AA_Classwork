require_relative "card"

class Deck
    attr_accessor :deck

    def initialize
        @deck = []
    end

    def create_deck
        values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        suits = ["heart", "diamond", "club", "spade"]

        values.each do |value|
            suits.each do |suit|
                @deck << Card.new(value, suit)
            end
        end
    end

    def shuffle
        @deck = @deck.shuffle
    end
end

# d = Deck.new

# orignal = d.create_deck
# d.shuffle
# p d.deck.sort == orignal.sort