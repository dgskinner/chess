class Rook < SlidingPiece
  
  def directions
    HORIZONTALS
  end
  
  def inspect
     self.color == :w ? "\u2656" :  "\u2656".blue
  end
end
