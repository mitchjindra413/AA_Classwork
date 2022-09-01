module Slideable
HORIZONTAL_DIRS = [[0,1], [1,0], [-1,0], [0,-1]]
DIAGONAL_DIRS = [[-1,-1], [-1,1], [1,1], [1,-1]]

    def horizontal_dirs
    HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        possible_moves = []
        start_row = self.pos[0]
        start_col = self.pos[1]
        
        move_dirs.each do |increment|
            dx = increment[0]
            dy = increment[1]
            new_pos = grow_unblocked_moves_in_dirs(pos, dx, dy)

            while @board.valid_pos?(new_pos)
                if @board.empty?(new_pos)
                    possible_moves << new_pos
                    new_pos = grow_unblocked_moves_in_dirs(new_pos, dx, dy)
                elsif opponents_piece?(new_pos)
                    possible_moves << new_pos
                    break
                elsif @board[new_pos].color == self.color
                    break
                end
            end
        end
        possible_moves 
    end

    def grow_unblocked_moves_in_dirs(pos, dx, dy)
        #breaks the "self" into row[1] col [2]
        #[dx + row dy +col]
        row, col = self.pos
        [row + dx, col + dy]
    end

    private
    def move_dirs
        raise 'error, entered module :('
    end

    

end