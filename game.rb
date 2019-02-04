class Game
 
    attr_accessor :player1 , :player2 , :board_array , :current_player_move

    def initialize(player1,player2)
        @player1 = player1
        @player2 = player2
        @board_array = Array.new(3){Array.new(3,"_")} 
    end


    def move(i)
        if i%2==0
            puts "Player #{@player1.name}'s turn: "
            @current_player_move = @player1
        else
            puts "Player #{@player2.name}'s turn: "
            @current_player_move = @player2
        end
        player_move = gets.chomp
        player_move.upcase!
        case player_move
        when "Q"
            @board_array[0][0] = @current_player_move.mark
        when "W"
            @board_array[0][1] = @current_player_move.mark
        when "E"
            @board_array[0][2] = @current_player_move.mark
        when "A"
            @board_array[1][0]= @current_player_move.mark
        when "S"
            @board_array[1][1] = @current_player_move.mark
        when "D"
            @board_array[1][2] = @current_player_move.mark
        when "Z"
            @board_array[2][0] = @current_player_move.mark
        when "X"
            @board_array[2][1] = @current_player_move.mark
        when "C"
            @board_array[2][2] = @current_player_move.mark
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
            check_if_equals(@board_array[0][0],@board_array[0][1],@board_array[0][2]) or 
            check_if_equals(@board_array[1][0],@board_array[1][1],@board_array[1][2]) or 
            check_if_equals(@board_array[2][0],@board_array[2][1],@board_array[2][2]) or
            # vertical
            check_if_equals(@board_array[0][0],@board_array[1][0],@board_array[2][0]) or
            check_if_equals(@board_array[0][1],@board_array[1][1],@board_array[2][1]) or
            check_if_equals(@board_array[0][2],@board_array[1][2],@board_array[2][2]) or
            # diagonal
            check_if_equals(@board_array[0][0],@board_array[1][1],@board_array[2][2]) or
            check_if_equals(@board_array[0][2],@board_array[1][1],@board_array[2][0]) 
            
            
            return true

        else
            return false
        end
      end

      def check_if_equals(e1,e2,e3)
            if e1 == e2 and e2 == e3 and e1 != '_'
                return true
            else
                return false
            end
      end

end
