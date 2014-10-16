class Bishop < SlidingPiece
  
  def directions
    DIAGONALS
  end
  
  def inspect
    self.color == :w ? "\u2657" :  "\u2657".blue
  end
  
end
