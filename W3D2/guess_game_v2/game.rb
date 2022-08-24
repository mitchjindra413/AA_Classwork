require_relative "board"
require_relative "computer_player"
require_relative "human_player"

require "byebug"

class Game
    attr_reader :grid, :computer
    def initialize
        @grid = Board.new
        @human_player = HumanPlayer.new
        @computer = ComputerPlayer.new
        @current_player = @human_player
        @seen = Hash.new {|hash, key| hash[key] = []}
        @revealed = []
    end

    def switch_player!
        if @current_player == @human_player
            @current_player = @computer
        else
            @current_player = @human_player
        end
    end

    def play
        @grid.populate
        until @grid.won?
            @grid.print
            pos = @current_player.get_move1(@seen, @revealed)
            pos = @grid.get_position(pos) # [1, 2]
            card_1 = @grid[pos] 
            card_1.reveal
            @grid.print
            puts 'guess 1'
            @seen[card_1.face_value] << pos

            pos = @current_player.get_move2(@seen, @revealed)
            pos = @grid.get_position(pos) # [1, 2]
            card_2 = @grid[pos] 
            card_2.reveal
            @grid.print
            puts 'guess 2'
            @seen[card_2.face_value] << pos

            if card_2.face_value != card_1.face_value
                card_1.hide
                card_2.hide
            else
                @revealed << card_1 << card_2
                @seen.delete(card_1.face_value)
            end

            self.switch_player!
        end
        puts "you did it!"
    end

end