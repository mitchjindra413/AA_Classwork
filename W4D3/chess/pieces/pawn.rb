require_relative "piece"

class Pawn < Piece
    def initialize(color, board, pos)
        super
    end

    def symbol
      if @color == "white"
            "+P"
      else
            "-P"
      end
    end

    def moves
        side_attack + forward_step_1 + forward_step_2
    end

    private
    def side_attack
        possible_side_attack = []
        row, col = self.pos 
        if self.color == "white"
            left_side = [row - 1, col - 1]
            right_side = [row - 1, col + 1]
            if @board.valid_pos?(left_side) && opponents_piece?(left_side)
                possible_side_attack << left_side
            elsif @board.valid_pos?(right_side) && opponents_piece?(right_side)
                possible_side_attack << right_side
            end
        else
            left_side = [row + 1, col - 1]
            right_side = [row + 1, col + 1]
            if @board.valid_pos?(left_side) && opponents_piece?(left_side)
                possible_side_attack << left_side
            elsif @board.valid_pos?(right_side) && opponents_piece?(right_side)
                possible_side_attack << right_side
            end
        end
        possible_side_attack
    end

    def start_row?
        if self.color == "white"
            self.pos[0] == 6
        else
            self.pos[0] == 1
        end 
    end

    def forward_step_1
        possible_forward_steps = []
        row, col = self.pos 
        if self.color == "white"
            side = [row - 1, col]
            if @board.valid_pos?(side)
                unless opponents_piece?(side) || same_color(side)
                    possible_forward_steps << side
                end
            end
        else
            side = [row + 1, col]
            if @board.valid_pos?(side)
                unless opponents_piece?(side) || same_color(side)
                    possible_forward_steps << side
                end
            end
        end
        possible_forward_steps
    end

    def forward_step_2
        possible_forward_steps = []
        row, col = self.pos 
        if self.color == "white"
            if self.pos[0] == 6
                side = [row - 2, col]
                if @board.valid_pos?(side)
                    unless opponents_piece?(side) || same_color(side)
                        possible_forward_steps << side
                    end
                end
            end
        else
            if self.pos[0] == 1
                side = [row + 2, col]
                if @board.valid_pos?(side)
                    unless opponents_piece?(side) || same_color(side)
                        possible_forward_steps << side
                    end
                end
            end
        end
        possible_forward_steps
    end

end