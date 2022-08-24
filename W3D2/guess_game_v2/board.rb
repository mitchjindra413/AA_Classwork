require 'byebug'
require_relative 'card'

class Board
    BANK = ["A", "A", 'B', 'B', 'C', 'C', 'D', 'D', 'E', 'E', 'F', 'F', 'G', 'G', 'H', 'H']    

    def initialize
        @board = Array.new(4) {Array.new(4)}
        @size = 4
    end

    def populate
        i = 0
        scrambled = BANK.shuffle
        scrambled = scrambled
        (0...@board.size).each do |row|
            (0...@board.size).each do |col|
                @board[row][col] = Card.new(scrambled[i])
                i += 1
            end
        end
        true
    end

    def won?
        @board.flatten.none? {|ele| ele.current_state == '?'}
    end

    def print
        puts "----------"
        @board.each do |row|
            new_arr = []
            row.each do |ele|
                new_arr << ele.current_state
            end
            puts new_arr.join(" ")
        end
        puts "----------"
        true
    end

    def get_position(move) # expecting [1,2]
        pos = move.map {|ele| ele.to_i} # [1, 2]
        
        if pos.length == 2 && pos[0] >= 0 && pos[0] < @size && pos[1] >= 0 && pos[1] < @size
            return pos
        else
            raise 'sorry that move is out of range'
        end
    end

    def [](array)
        @board[array[0]][array[1]]
    end

    def []=(pos, value)
        @board[pos[0]][pos[1]] = value
    end
end

