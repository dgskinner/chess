class SlidingPiece < Piece
  
  DIAGONALS =   [ [1, 1], [1, -1], [-1, 1], [-1, -1] ]
  HORIZONTALS = [ [1, 0], [-1, 0], [0, -1], [0, 1]   ]
  
  def possible_moves
    possible_moves = []
    row, column = @pos
    directions.each do |dir|
      row_move, column_move = dir
      new_pos = [row + row_move, column + column_move]
      while @board.on_board?(new_pos) && allowed?(new_pos)
        # break if piece taken
        possible_moves << new_pos
        #if the position is occupied by an enemy, it is valid
        #but we must not continue in this direction
        break unless @board[new_pos].nil?
        first, second = new_pos
        new_pos = [first + row_move, second + column_move]
      end
    end

    possible_moves
  end
  
  end