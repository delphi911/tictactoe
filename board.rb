class Board
    attr_accessor :board  
    def initialize
        @board = [1,2,3,4,5,6,7,8,9]
    end

    def drawboard
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "---|---|---"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "---|---|---"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def checkcell(n)
        board[n.to_i-1].is_a?(Integer)
    end

    def checkdraw
        @board.all? { |n| n.is_a?(String) }
    end
    
    def checkwincondition
      combinations = [
          [@board[0], @board[1], @board[2]],
          [@board[3], @board[4], @board[5]],
          [@board[6], @board[7], @board[8]],
          [@board[0], @board[3], @board[6]],
          [@board[1], @board[4], @board[7]],
          [@board[2], @board[5], @board[8]],
          [@board[0], @board[4], @board[8]],
          [@board[2], @board[4], @board[6]]
        ]
      combinations.any? do |combo|
        return "x" if combo.all? { |n| n == 'x' }
        return "o" if combo.all? { |n| n == 'o' }
      end
      false 
    end
end
