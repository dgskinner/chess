class Queen < SlidingPiece
  
  def directions 
    HORIZONTALS + DIAGONALS
  end
end