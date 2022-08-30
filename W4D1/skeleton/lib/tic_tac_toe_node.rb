require_relative 'tic_tac_toe'
require 'byebug'
class TicTacToeNode
  
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if self.board.over?
      if self.board.winner != evaluator && self.board.winner != nil
        return true
      elsif self.board.winner == evaluator && self.board.winner != nil
        return false
      end
    end

    if self.next_mover_mark == evaluator
      self.children.all? {|el| el.losing_node?(evaluator)}
    else  
      self.children.any? {|el| el.losing_node?(evaluator)}
    end

  end

  def winning_node?(evaluator)
    if self.board.over?
      if self.board.winner == evaluator && self.board.winner != nil
        return true
      elsif self.board.winner != evaluator && self.board.winner != nil
        return false
      end
    end

    if self.next_mover_mark == evaluator
      self.children.any? {|el| el.winning_node?(evaluator)}
    else  
      self.children.all? {|el| el.winning_node?(evaluator)}
    end
    
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    moves = []
    (0...3).each do |row|
      (0...3).each do |col|
        if @board.empty?([row, col])
          pos = [row, col]
          child_board = @board.dup
          child_board[pos] = next_mover_mark
          if @next_mover_mark == :x
            changed = :o
          else
            changed = :x
          end
          moves << TicTacToeNode.new(child_board, changed, pos)
        end
      end
    end
    moves
  end


end



    # if evaluator == :x
    #   other_mark = :o
    # else
    #   other_mark = :x
    # end
    
    
    # # if self.board.over?
    # #   if self.board.winner != evaluator
    # #     return false
    # #   else
    # #     return true
    # #   end
    # # end


    # if self.board.winner == evaluator
    #   p "won"
    #   return false
    # end
    # if self.board.winner == other_mark
    #   p 'other player won'
    #   return true
    # end
    # if self.board.over? && self.board.winner != evaluator
    #   p "tie"
    #   return false
    # end

    # self.children.each do |el|
    #   el.losing_node?(evaluator)
    # end

    # true
