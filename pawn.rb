class Pawn < Piece
  
  WHITEPAWN_MOVE = [[-1, 0]]
  WHITEPAWN_TAKE = [[-1, 1], [-1, -1]]
  BLACKPAWN_MOVE = [[1, 0]]
  BLACKPAWN_TAKE = [[1, 1], [1, -1]]
  
  def possible_moves
    possible_moves = []
    row, column = @pos
    directions.each do |dir|
      row_move, column_move = dir
      new_pos = [row + row_move, column + column_move]
      if @board.on_board?(new_pos) && allowed?(new_pos)
        possible_moves << new_pos 
      end
    end
    p "these are the possible takes:#{possible_takes}"
    
    possible_moves + possible_takes
  end
  
  def possible_takes
    possible_takes = []
    row, column = @pos
    directions.each do |dir|
      row_move, column_move = dir
      new_pos = [row + row_move, column + column_move]
      possible_takes << new_pos if take_allowed?(new_pos)
    end
    
    possible_takes    
  end
  
  def take_allowed?(new_pos)
    return false if @board[pos] == " "
    p "#{@board[pos].color}"
    return true if @board[pos].color != @color && @board.on_board?(new_pos)
    false
  end
  
  def directions
    if @color == :w
      WHITEPAWN_MOVE
    elsif @color == :b
      BLACKPAWN_MOVE
    end
  end
  
  def take_directions
    if @color == :w
      WHITEPAWN_TAKE
    elsif @color == :b
      BLACKPAWN_TAKE
    end
  end
  
end