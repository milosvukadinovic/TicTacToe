class Prompt

         require './player.rb'
         require './game.rb'


    def start_the_game

        puts "Welcome to TicTacToe"
        
        puts "Please enter the name for player one "
        @name1 = gets.chomp
        @player1 = Player.new(@name1,"X")
    

        
        puts "Please enter the name for player two "
        @name2 = gets.chomp
        @player2 = Player.new(@name2,"O")
        
        
        @game = Game.new(@player1,@player2)
        
        # Promtp the info
        show_info()
        
        # Promting the board
        showboard(@game.board_array)
        
        # Get user input and check wining
        #loop the shit up to 9 times. get moves, check every time if there are winning conditions, return the winner, increment score etc
        i=0
        while i<9    
            @game.move(i)
            showboard(@game.board_array)
           if  @game.check_if_win
            break
            end

            i+=1
        end
        if @game.check_if_win
            puts "#{@game.current_player_move.name} is the winner "
        else
            puts "Its a draw!"
        end
    end

    def showboard arr
        puts "
            [#{arr[0][0]}] [#{arr[0][1]}] [#{arr[0][2]}]
            [#{arr[1][0]}] [#{arr[1][1]}] [#{arr[1][2]}]
            [#{arr[2][0]}] [#{arr[2][1]}] [#{arr[2][2]}]
             "
    end
    
    def show_info 
        puts "

How To Play (Use letters corresponding to board position)
        [ Q ] [ W ] [ E ] 
        [ A ] [ S ] [ D ]
        [ Z ] [ X ] [ C ]

"
    end

end

# The Starting Point Of The Game
   prompt = Prompt.new
   prompt.start_the_game