class Knight < SteppingPiece
  
  def directions
    KNIGHT
  end
  
  def inspect
     self.color == :w ? "\u2658" :  "\u2658".blue
  end
  
end