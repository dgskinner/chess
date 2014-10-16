class King < SteppingPiece

  def directions
    KING
  end
  
  def inspect
    self.color == :w ? "\u2654" :  "\u2654".blue
  end
  
end