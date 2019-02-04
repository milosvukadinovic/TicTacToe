class Game
 
    attr_accessor :player1 , :player2 , :board_array , :current_player_move

    def initialize(player1,player2)
        @player1 = player1
        @player2 = player2
        @board_array = Array.new(3){Array.new(3,"_")} 
    end


    def move(i)
        if i%2==0
            puts "Player #{@player1}'s move: "
            @current_player_move = @player1
        else
            puts "Player #{@player2}'s move: "
            @current_player_move = @player2
        end
        player_move = gets.chomp
        player_move.upcase
        case player_move
        when "Q"
            @board_array[0][0] = player.mark
        when "W"
            @board_array[0][1] = player.mark
        when "E"
            @board_array[0][2] = player.mark
        when "A"
            @board_array[1][0]=player.mark
        when "S"
            @board_array[1][1] = player.mark
        when "D"
            @board_array[1][2] = player.mark
        when "Z"
            @board_array[2][0] = player.mark
        when "X"
            @board_array[2][1] = player.mark
        when "C"
            @board_array[2][2] = player.mark
        when "EXIT"
            return
        else
            puts "You gave me #{player_move} -- I have no idea what to do with that. Try again. If you want to quit type EXIT. "
            move(i)
        end
    end

     def check_if_win
        if 
            #horizontal
            check_if_equals(arr[0][0],arr[0][1],arr[0][2]) or 
            check_if_equals(arr[1][0],arr[1][1],arr[1][2]) or 
            check_if_equals(arr[2][0],arr[2][1],arr[2][2]) or
            # vertical
            check_if_equals(arr[0][0],arr[1][0],arr[2][0]) or
            check_if_equals(arr[0][1],arr[1][1],arr[2][1]) or
            check_if_equals(arr[0][2],arr[1][2],arr[2][2]) or
            # diagonal
            check_if_equals(arr[0][0],arr[1][1],arr[2][2]) or
            check_if_equals(arr[0][2],arr[1][1],arr[2][0]) 
            
            puts "#{@current_player_move.name} is the winner "
            return true

        else
            return false
        end
      end

      def check_if_equals(e1,e2,e3)
            if e1 == e2 and e2 == e3 
                return true
            else
                return false;
            end
      end

end
