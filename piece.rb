class Piece
  attr_reader :pos, :color
  
  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  
  def move(position)
    if possible_moves.include?(position)
      @board.[]=(position, self) #NEEDS TO BE SELF
      @board.[]=(@pos, " ")
      puts "you can do that"
      @pos = position
    end
  end
  
  def allowed?(pos)
    p @board[pos]
    return true if @board[pos] == " "
    puts  @board[pos].color
    return false if @board[pos].color == @color
    true
  end
end

