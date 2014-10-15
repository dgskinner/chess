class Board  
  def setup_grid
    Array.new(8) { Array.new(8) { " " } }
  end
  
  def initialize
    @grid = setup_grid
  end
  
  def []=(pos, val)
    row, column = pos
    @grid[row][column] = val
  end
  
  def [](pos)
    row, column = pos
    @grid[row][column]
  end
  
  def display
    header = "   "
    (0..7).each {|i| header += " #{i}    "}
    puts header
    @grid.each_with_index do |row, row_index|
      
      show = row.map do |item|
        if item.is_a?(String)
          "  "
        else
          "#{item.color.to_s + item.class.to_s[0]}" 
        end
      end

      puts row_index.to_s + " " +  show.inspect
      puts " "
    end
  end
  
  def place_piece
  end
  
  def on_board?(pos)
    pos.all? { |idx| idx.between?(0, 7) }
  end
  
  
end


