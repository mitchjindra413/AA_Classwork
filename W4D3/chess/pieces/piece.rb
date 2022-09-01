# require "../board.rb"

class Piece
    attr_reader :pos, :color
    attr_writer :pos
    
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def inspect
        symbol
    end

    #when printing out the board print k for k
    def to_s
    end

    def empty?
        self.nil?
    end

    def opponents_piece?(pos)
        !@board[pos] == nil && @board[pos].color != self.color
    end

    def same_color(pos)
        @board[pos].color == self.color
    end

    def valid_moves
        #call the moves function and remove invalid positions

    end

    # def valid_pos?(pos)
    #     row, col = pos
    #     # out of bounds
    #     if row < 0 || row > 7
    #         return false
    #     elsif col < 0 || col > 7
    #         return false
    #     end
    #     # if end space has same color piece

    # end

    def pos=(val)
    end

    def symbol
        raise "method not implemented"
    end

    private
    def move_into_check?(end_pos)
    end

end