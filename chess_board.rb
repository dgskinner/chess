class Board  
  attr_reader :grid
  
  def setup_grid
    Array.new(8) { Array.new(8) { nil } }
  end
  
  def initialize(fill_board = true)
    @grid = setup_grid
    place_pieces if fill_board
  end
  
  def dup
    dup_board = Board.new(false)
    8.times do |row|
      8.times do |col|
        old_piece = self.[]([row, col])
        next if old_piece.nil?
        dup_pos = [row, col]
        new_piece = old_piece.class.new(dup_pos, dup_board, old_piece.color)
        dup_board.[]=(dup_pos, new_piece)
      end
    end
      
    dup_board
  end
  
  def []=(pos, val)
    row, column = pos
    @grid[row][column] = val
  end
  
  def [](pos)
    row, column = pos
    @grid[row][column]
  end
  
  def move(start, end_pos, color)
    piece_to_move = self[start]
    if piece_to_move.nil?
      raise NilPieceError.new
    elsif !piece_to_move.moves.include?(end_pos)
      raise InvalidMoveError.new
    elsif piece_to_move.move_into_check?(end_pos)
      raise CheckMateError.new
    elsif piece_to_move.color != color
      raise BadColorError.new
    end
    
    move!(start, end_pos)
  end
  
  def move!(start, end_pos)
    piece_to_move = self.[](start)
    self[start] = nil
    self[end_pos] = piece_to_move
    piece_to_move.pos = end_pos
  end

  def place_pieces
    
    blacks = [Rook.new([0, 0], self, :b), Knight.new([0, 1], self, :b),
              Bishop.new([0, 2], self, :b), Queen.new([0, 3], self, :b),
              King.new([0, 4], self, :b), Bishop.new([0, 5], self, :b),
              Knight.new([0, 6], self, :b), Rook.new([0, 7], self, :b), 
              Pawn.new([1, 0], self, :b), Pawn.new([1, 1], self, :b), 
              Pawn.new([1, 2], self, :b), Pawn.new([1, 3], self, :b), 
              Pawn.new([1, 4], self, :b), Pawn.new([1, 5], self, :b),
              Pawn.new([1, 6], self, :b), Pawn.new([1, 7], self, :b)]
              
    whites = [Rook.new([7, 0], self, :w), Knight.new([7, 1], self, :w),
              Bishop.new([7, 2], self, :w), Queen.new([7, 3], self, :w),
              King.new([7, 4], self, :w), Bishop.new([7, 5], self, :w),
              Knight.new([7, 6], self, :w), Rook.new([7, 7], self, :w), 
              Pawn.new([6, 0], self, :w), Pawn.new([6, 1], self, :w), 
              Pawn.new([6, 2], self, :w), Pawn.new([6, 3], self, :w), 
              Pawn.new([6, 4], self, :w), Pawn.new([6, 5], self, :w),
              Pawn.new([6, 6], self, :w), Pawn.new([6, 7], self, :w)]
              
    (blacks + whites).each do |piece|
      self.[]=(piece.pos, piece)
    end
    
  end
  
  def find_colors(color)
    @grid.flatten.compact.select {|item| item.color == color}
  end
  
  def in_check?(color)
    king = find_colors(color).find {|piece| piece.is_a?(King)}
    enemy_pieces = find_colors(other_color(color))
    
    enemy_pieces.any? { |piece| piece.moves.include?(king.pos) }
  end
  
  def checkmate?(color)
    if in_check?(color) && find_colors(color).all? do |piece|
      piece.moves.all? { |move| piece.move_into_check?(move) }
        end
      return true
    end
    
    false
  end
  
  def other_color(color)
    color == :b ? :w : :b
  end
  
  def print_board
    header = "   "
    (0..7).each {|i| header += " #{i}  "}
    puts header
    @grid.each_with_index do |row, row_index|
      
      show = row.map.with_index do |item, index|
        if item.nil?
          space = "    "
        else
          space = " #{item.inspect}  "
        end
        (row_index + index).odd? ? space : space.on_red
      end
      print row_index.to_s + " " 
      show.each {|item| print item} 
      puts " "
    end
  end
  
  def on_board?(pos)
    pos.all? { |idx| idx.between?(0, 7) }
  end
  
end


