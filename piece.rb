class Piece
  attr_accessor :pos
  attr_reader :color
  
  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end
  
  def moves
    moves = self.possible_moves
  end
  
  def move_into_check?(new_position)
    duped_board = @board.dup
    duped_board.move!(@pos.dup, new_position)
    return true if duped_board.in_check?(@color)
    false
  end
  
  def allowed?(pos)
    return true if @board[pos].nil?
    return false if @board[pos].color == @color
    true
  end
end

