class Game
 
    attr_accessor :player1 , :player2 , :board_array

    def initialize(player1,player2)
        @player1 = player1
        @player2 = player2
        @board_array = Array.new(3){Array.new(3,"_")} 
    end
    


end
