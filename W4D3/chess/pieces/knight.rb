require_relative "piece"

class Knight < Piece
    include Stepable

    def initialize(color, board, pos)
        super
    end

    def symbol
        if @color == "white"
            "+Kn"
        else
            "-Kn"
        end
    end

    def moves_diffs
        [[-2,-1], [-1,-2], [1,-2], [2,-1], [2,1], [1,2], [-1,2], [-2,1]]
    end
end