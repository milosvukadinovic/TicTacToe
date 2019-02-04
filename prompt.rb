class Prompt
    include './player.rb'
    include './game.rb'
    
    def start
        print "Welcome to TicTacToe"
        print "Please enter the name for player one"
        name = gets.chomp.split('')
        player1 = new Player(name, "X")
        print "Please enter the name for player two"
        name = gets.chomp.split('')
        player2 = new Player(name, "O")

        game = new Game(player1 , player2)
        
        
    end

    def showboard()

end