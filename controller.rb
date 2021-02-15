class Controller
    #defines user actions
    def initialize(players)
      @p1 = players[0]
      @p2 = players[1]
    end
    
    def selectmove(cell)

    end

    def play
      puts "Lets start the game"
    end
  
    def ai
      puts "Not impemented yet."
    end
  
    def quit
      puts "Goodbye."
    end

    def startinggame
        puts "Shall we play a game of tictactoe?"
        puts "#{@p1.name}(o) VS #{@p2.name}(x)"
        puts "Lets Start!."
    end
  end
