require_relative 'chess_game'

grid = Board.new
# grid.[]=([3, 3], "X")
# grid.display
# puts
p = Pawn.new([0,3], grid, :w)
grid.[]=([0, 3], p)
q = Queen.new([1 ,4], grid, :b)
grid.[]=([1, 4], q)
grid.display
while true 
  move = gets.chomp 
  move = move.split(",").map(&:to_i)
  p.move(move)
  grid.display
  puts " "
end


