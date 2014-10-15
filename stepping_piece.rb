class SteppingPiece < Piece
  
  KNIGHT = [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]
  KING = [[1, 1], [1, -1], [-1, 1], [-1, -1], [1, 0], [-1, 0], [0, -1], [0, 1]]
 
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

    possible_moves
  end


end