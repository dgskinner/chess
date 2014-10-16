class Queen < SlidingPiece
  
  def directions 
    HORIZONTALS + DIAGONALS
  end
  
  def inspect
    self.color == :w ? "\u2655" :  "\u2655".blue
  end
end