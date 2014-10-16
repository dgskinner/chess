class Pawn < Piece
  
  WHITEPAWN_MOVE = [[-1, 0]]
  WHITEPAWN_TAKE = [[-1, 1], [-1, -1]]
  WHITEPAWN_TWOSTEP = [[-2, 0]]
  BLACKPAWN_MOVE = [[1, 0]]
  BLACKPAWN_TAKE = [[1, 1], [1, -1]]
  BLACKPAWN_TWOSTEP = [[2, 0]]
  
  def possible_moves
    possible_moves = []
    row, column = @pos
    
    move_directions.each do |dir|
      row_move, column_move = dir
      new_pos = [row + row_move, column + column_move]
      if @board.on_board?(new_pos) && allowed?(new_pos)
        possible_moves << new_pos 
      end
    end
    
    possible_moves + possible_takes
  end
  
  def possible_takes
    possible_takes = []
    row, column = @pos
    take_directions.each do |dir|
      row_move, column_move = dir
      new_pos = [row + row_move, column + column_move]
      possible_takes << new_pos if take_allowed?(new_pos)
    end

    possible_takes
  end
  
  def twostep_allowed?
    if @color == :w
      return true if @pos[0] == 6
    elsif @color == :b
      return true if self.pos[0] == 1
    end
    
    false
  end
  
  def allowed?(pos)
    return true if @board[pos].nil?
    return false if @board[pos]
    true
  end
  
  def take_allowed?(new_pos)
    return false if @board[new_pos].nil?
    return true if @board.on_board?(new_pos) && @board[new_pos].color != @color
    false
  end
  
  def move_directions
    if @color == :w
      twostep_allowed? ? WHITEPAWN_MOVE + WHITEPAWN_TWOSTEP : WHITEPAWN_MOVE
    elsif @color == :b
      twostep_allowed? ? BLACKPAWN_MOVE + BLACKPAWN_TWOSTEP : BLACKPAWN_MOVE
    end
  end
  
  def take_directions
    if @color == :w
      WHITEPAWN_TAKE
    elsif @color == :b
      BLACKPAWN_TAKE
    end
  end
  
  def twostep_directions
    if @color == :w
      WHITEPAWN_TWOSTEP
    elsif @color == :b
      BLACKPAWN_TWOSTEP
    end
  end
  
  def inspect
    self.color == :w ? "\u2659" :  "\u2659".blue
  end
  
end