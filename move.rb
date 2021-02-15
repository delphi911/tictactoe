class Move
  attr_accessor :grid 

  def initialize
    @grid = 0
  end

  def getmove
    moveinput
    while (@grid<0 || @grid>9)do
        puts "Please enter a valid move. Valid moves are between 1 and 9."
        moveinput
    end
    @grid
  end

  def moveinput
    puts "Enter a valid value (1-9) : ?"
    @grid = gets.chomp.to_i
  end
end
