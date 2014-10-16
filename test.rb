require_relative 'chess_game'

grid = Board.new
# grid.[]=([3, 3], "X")
# grid.display
# puts
# grid.[]=([0, 3], p)
# q = Queen.new([2 ,4], grid, :w)
# grid.[]=([2, 4], q)
# r = Rook.new([2 ,4], grid, :w)
# grid.[]=([4, 3], r)
# b = Bishop.new([2 ,4], grid, :w)
# grid.[]=([4, 5], b)

grid.print_board
while true
  begin
  puts "Where would you like to move from?"
  from = gets.chomp
  from = from.split(",").map(&:to_i)
  puts "Where would you like to move to?"
  to = gets.chomp
  to = to.split(",").map(&:to_i)


  grid.move(from, to)
  rescue NilPieceError
    puts "Need a valid starting piece"
  rescue InvalidMoveError
    puts "Invalid Move!"
  rescue CheckMateError
    puts "Cannot move into check"
    retry
  end
  grid.print_board
  
  puts "checkmate" if grid.checkmate?(:b)
  puts " "
end

# new_grid = grid.dup
# grid.display
# new_grid.display
# grid.move([6, 0], [4, 0])
# grid.display
# new_grid.display


