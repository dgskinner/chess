require_relative 'chess_pieces'
require_relative 'chess_board'
require 'colorize'

class NilPieceError < StandardError
end

class InvalidMoveError < StandardError
end

class CheckMateError < StandardError
end

class BadColorError < StandardError
end

class Game 
  
  def initialize
    @player_1 = Human.new(:w)
    @player_2 = Human.new(:b)
    @grid = Board.new
  end
  
  def play
    system "clear"
    @grid.print_board
    until @grid.checkmate?(:w) || @grid.checkmate?(:b)
      @player_1.play_turn(@grid)
      @grid.print_board
      @player_2.play_turn(@grid)
      @grid.print_board
    end
    
    @grid.checkmate?(:w) ? "Black Wins!" : "White Wins!"
  end
  
end


class Human
  attr_reader :color
  
  def initialize(color)
    @color = color
  end
  
  def color_message
    puts (@color == :w ? "White Turn" : "Black Turn")
  end
  
  def play_turn(grid)
    begin
    color_message
    puts "Where would you like to move from?"
    from = gets.chomp
    from = from.split(",").map(&:to_i)
    puts "Where would you like to move to?"
    to = gets.chomp
    to = to.split(",").map(&:to_i)
    grid.move(from, to, color)
      
    rescue NilPieceError
      puts "Need a valid starting piece"
    rescue InvalidMoveError
      puts "Invalid Move!"
    rescue CheckMateError
      puts "Cannot move into check"
    rescue BadColorError
      puts "Must move a piece of your color"
      retry
    end
    system "clear"
  end
  
end

game = Game.new
game.play
