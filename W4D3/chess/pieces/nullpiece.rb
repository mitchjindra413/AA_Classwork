require_relative "piece"
require_relative "slideable"
require "singleton"

class NullPiece < Piece
    include Singleton

    def initialize
        @symbol = ' '
        @color = :none
    end

    def symbol
        @symbol
    end

    def moves
        raise "Cannot move nullpiece"
    end

end