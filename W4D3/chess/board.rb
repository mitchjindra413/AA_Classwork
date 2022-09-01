require_relative "./pieces/all_pieces.rb"
class Board

    def initialize
        @rows = Array.new(8){Array.new(8, NullPiece.instance) }
        set_up_board(@rows)
        
    end


    def set_up_board(board)
        pieces = [Rook.new("black", self, [0,0]), Knight.new("black", self, [0,1]), Bishop.new("black", self, [0,2]), King.new("black", self, [0,3]), 
              Queen.new("black", self, [0,4]), Bishop.new("black", self, [0,5]), Knight.new("black", self, [0,6]), Rook.new("black", self, [0,7])]

        wpieces = [Rook.new("white", self, [7,0]), Knight.new("white", self, [7,1]), Bishop.new("white", @row, [7,2]), King.new("white", @row, [7,3]), 
              Queen.new("white", @row, [7,4]), Bishop.new("white", self, [7,5]), Knight.new("white", self, [7,6]), Rook.new("white", self, [7,7])]

        pawns = [Pawn.new("black", self, [1,0]), Pawn.new("black", self, [1,1]), Pawn.new("black", self, [1,2]), Pawn.new("black", self, [1,3]), 
             Pawn.new("black", self, [1,4]), Pawn.new("black", self, [1,5]), Pawn.new("black", self, [1,6]), Pawn.new("black", self, [1,7])]

        wpawns =[Pawn.new("white", self, [6,0]), Pawn.new("white", self, [6,1]), Pawn.new("white", self, [6,2]), Pawn.new("white", self, [6,3]), 
             Pawn.new("white", self, [6,4]), Pawn.new("white", self, [6,5]), Pawn.new("white", self, [6,6]), Pawn.new("white", self, [6,7])]

        board.each_with_index do |row, index|
            if index == 0
                row.replace(pieces)
            elsif index == 1
                row.replace(pawns)
            elsif index == 6
                row.replace(wpawns)
            elsif index == 7
                row.replace(wpieces)
            end
        end
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, value)
        x, y = pos
        @rows[x][y] = value
    end

    def empty?(pos)
        self[pos] == NullPiece.instance
    end

    def valid_pos?(pos)
        if !(0..7).include?(pos[0]) || !(0..7).include?(pos[1])
            return false
        end
        true
    end

    def move_piece(start_pos, end_pos)
        piece = self[start_pos]

        if !valid_pos?(start_pos)
            raise "Not valid start position"
        end

        if !piece.moves.include?(end_pos)
            raise "Not valid end position"
        end

        unless piece == nil
            self[start_pos] = NullPiece.instance
            self[end_pos] = piece
        else
            raise "Starting position is empty"
        end

        piece.pos = end_pos

    end

    def print
        @rows.each do |row|
            symbols_arr = []
            row.each do |instance|
                symbols_arr << instance.symbol
            end
            puts symbols_arr.join(" ")
        end
        return "done"
    end


end

