local_dir = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(local_dir)
require "player.rb"
require "move.rb"
require "board.rb"
require "controller.rb"
require "interface.rb"

class Gametictactoe
    attr_writer :playingplayer
    
    def initialize
        @moveNotOk=true
        @interface = Interface.new
        @players = [Player.new, Player.new]
        puts "What is your name? (player One)"
        @players[0].name = gets.strip
        @players[0].playerhandle = "o"
        puts "What is your name? (player Two)"
        @players[1].name = gets.strip
        @players[1].playerhandle = "x"
        @controller = Controller.new(@players) 
        @action = nil
        @playingplayer = ["o","x"].sample  #select first playing player
        @controller.startinggame
    end
    def play
        while @action != :quit
          get_action
          handle_action
          mainloop if @action == :play
        end
    end

    def mainloop
        @brd = Board.new
        @brd.drawboard
        while (!@brd.checkdraw) && (!@brd.checkwincondition) do
           puts "#{@players.detect{|player| player.playerhandle == @playingplayer}.name}(#{@playingplayer}) please make your turn"
           @moveNotOk=true
          while @moveNotOk do
            move = Move.new
            playermove=move.getmove

            if @brd.checkcell(playermove) 
                @brd.board[playermove-1] = @playingplayer
                @moveNotOk = false 
            else 
                puts "Since this place already have a move, your movement is invalid. Please make your move onto an unused place"
                @moveNotOk = true
            end
            changeplayer(@playingplayer)
            @brd.drawboard
          end
       end
       puts "Game is ended with a DRAW!!" if @brd.checkdraw
       puts "The Winner is ##{@players.detect{|player| player.playerhandle == @brd.checkwincondition}.name}(#{@brd.checkwincondition})" unless @brd.checkdraw
    end

    private

    def get_action
      @action = @interface.get_action
    end
  
    def handle_action
      @controller.send @action
    end

    def changeplayer(current)
     current=="o" ? @playingplayer="x" : @playingplayer="o"
    end
end

tictactoe = Gametictactoe.new
tictactoe.play
