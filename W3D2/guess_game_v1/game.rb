require_relative "board"
require "byebug"

class Game
    attr_reader :grid
    def initialize
        @grid = Board.new
    end

    def get_move
        puts "Pick card: Row,Col" # 1,2
        pos = gets.chomp.split(',') # ["1", "2"]
        pos.each do |ele|
            if ele.to_i.to_s != ele
                raise "invalid position"
            end
        end
        pos
    end

    def play
        @grid.populate
        until @grid.won?
            @grid.print
            pos = self.get_move
            pos = @grid.get_position(pos) # [1, 2]
            card_1 = @grid[pos] 
            card_1.reveal
            @grid.print

            pos = self.get_move
            @grid.print
            pos = @grid.get_position(pos) # [1, 2]
            card_2 = @grid[pos] 
            card_2.reveal
            @grid.print

            unless card_2.face_value == card_1.face_value
                card_1.hide
                card_2.hide
            end
        end
        puts "you did it!"
    end
end