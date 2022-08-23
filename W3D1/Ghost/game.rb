require_relative 'player'

class Game
    def initialize(???)
        @player_1 = Player.new(????)
        @player_2 = 
        words = File.readlines('dictionary.txt').map(&:chomp)
        @dictionary = Set.new(words)
        @fragment = ""
    end
end