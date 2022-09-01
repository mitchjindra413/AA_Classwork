module Stepable
    def moves
        possible_moves = [] 
        start_row = self.pos[0]
        start_col = self.pos[1]
        moves_diffs.each do |increment|
            row, col = increment
            new_pos = [start_row + row, start_col + col]
            if @board.valid_pos?(new_pos) 
                if @board.empty?(new_pos) || opponents_piece?(new_pos)
                    possible_moves << new_pos
                end
            end
                
        end
        possible_moves


    end

    private
    def moves_diffs
        raise "error, entered module"
    end
end