class Prompt

         require './player.rb'
         require './game.rb'


    def start_the_game

        puts " _____   _            _____                    _____                "
        puts "|_   _| (_)   ___    |_   _|   __ _    ___    |_   _|   ___     ___ "
        puts "  | |   | |  / __|     | |    / _` |  / __|     | |    / _ \\   / _ \\ "
        puts "  | |   | | | (__      | |   | (_| | | (__      | |   | (_) | |  __/ "
        puts "  |_|   |_| \\___|      |_|    \\__,_|  \\___|     |_|    \\___/   \\___| "
 
        puts 

         # Promtp the info
         show_info()

        puts 
        # Get user details
        puts "Please enter the name for player one "
        @name1 = gets.chomp.capitalize
        @player1 = Player.new(@name1,"X")
    

        
        puts "Please enter the name for player two "
        @name2 = gets.chomp.capitalize
        @player2 = Player.new(@name2,"O")
        
        
        @game = Game.new(@player1,@player2)
        
       
        
        # Promting the board
        showboard(@game.board_array)
        
        # Get user input and check wining
        #loop  9 times. get moves, check every time if there are winning conditions, return the winner, increment score etc
        i=0

        while i<9    
            @game.move(i)
            showboard(@game.board_array)
           if  @game.check_if_win
            break
            end

            if @game.exit
                break
            end

            i+=1
        end

        if @game.check_if_win 
            show_winner_text(@game.current_player_move.name)
        elsif !@game.exit
            show_draw_text
        else
            puts "Game Over "
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

    def show_winner_text name
        
        puts " ¸.•*¨*•.¸♪¸.•*¨*•.¸♥¸.•*¨*•.¸ Winner is #{name} ¸.•*¨*•.¸♪¸.•*¨*•.¸♥¸.•*¨*•.¸"    
   
    end

    def show_draw_text
        puts "
        
        ─────────▄▄───────────────────▄▄──
        ──────────▀█───────────────────▀█─
        ──────────▄█───────────────────▄█─
        ──█████████▀───────────█████████▀─
        ───▄██████▄─────────────▄██████▄──
        ─▄██▀────▀██▄─────────▄██▀────▀██▄
        ─██────────██─────────██────────██
        ─██───██───██─────────██───██───██
        ─██────────██─────────██────────██
        ──██▄────▄██───────────██▄────▄██─
        ───▀██████▀─────────────▀██████▀──
        ──────────────────────────────────
        ──────────────────────────────────
        ──────────────────────────────────
        ───────────█████████████──────────
        ──────────────────────────────────
        "
        puts "Its a draw!"
    end

    # helper class methods

    def self.position_taken
        puts "That position is already taken, try another one!"
    end
    def self.unkown_move(player_move)
        puts "You gave me #{player_move} -- I have no idea what to do with that. Try again. If you want to quit type \"exit\". "
    end

    def self.show_turn(name)
        print "Player #{name}'s turn(type 'exit' to stop the game): "
    end

end

# The Starting Point Of The Game
   prompt = Prompt.new
   prompt.start_the_game
