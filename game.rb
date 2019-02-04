class Game
 
    attr_accessor :player1 , :player2 , :board_array

    def initialize(player1,player2)
        @player1 = player1
        @player2 = player2
        @board_array = Array.new(3){Array.new(3,"_")} 
    end
    

    def move(i,arr)
        if i%2==0
            puts "Player #{@player1}'s move: "
            player=@player1
        else
            puts "Player #{@player2}'s move: "
            player=@player2
        end
        player_move = gets.chomp
        player_move.upcase
        case player_move
        when "Q"
            arr[0][0]=player.mark
        when "W"
            @arr[0][1]=player.mark
        when "E"
            @arr[0][2]=player.mark
        when "A"
            @arr[1][0]=player.mark
        when "S"
            @arr[1][1]=player.mark
        when "D"
            @arr[1][2]=player.mark
        when "Z"
            @arr[2][0]=player.mark
        when "X"
            @arr[2][1]=player.mark
        when "C"
            @arr[2][2]=player.mark
        when "EXIT"
            return
        else
            puts "You gave me #{player_move} -- I have no idea what to do with that. Try again. If you want to quit type EXIT. "
            move(i)
        end
    end

    # def check_if_win
    #     if #paralel
    #         arr[0][0] == arr[0][1] == arr[0][1] || arr[1][0] == arr[1][1] == arr[1][1] || 
    #         arr[2][0] == arr[2][1] == arr[2][1] || 
    #         #down
    #         arr[0][0] == arr[1][0] == arr[2][0]

    # end

end
