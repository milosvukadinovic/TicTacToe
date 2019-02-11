
require '../game.rb'
require '../player.rb'


RSpec.shared_examples "board_input" do |i,j,letter|
                
    before Game do 
        @player1 = Player.new("John Doe","X")
        @player2 = Player.new("Janet Doe","O")
        @game = Game.new(@player1,@player2)
        @turn_switch = true
    end

    it" sets letter #{letter} to its respected position" do 

            puts "#{@player1.name}"
            puts "#{@player2.name}"

         if @first_time
            @game.current_player_move = @player1
            @turn_switch = false
            
        else
            @game.current_player_move  = @player2
            @turn_switch = true
        end

        @game.set_board_value(letter,nil)
        expect(@game.board_array[i][j]).to eql(@game.current_player_move.mark)
    end

end

RSpec.shared_examples "winning_condition" do |aw,argument|
                
    before Game do 
        @player1 = Player.new("John Doe","X")
        @player2 = Player.new("Janet Doe","O")
        @game = Game.new(@player1,@player2)
        @turn_switch = true
    end

    it" checks winning condition" do 

        for i in 0..aw.length-1
            if i%2==0
                @game.current_player_move = @player1
            else
                @game.current_player_move = @player2
            end
            @game.set_board_value(aw[i],i)
        end
        expect(@game.check_if_win).to eql(argument)
            

        
    end

end

RSpec.describe "tests the input from user" do 
    include_examples "winning_condition",["q","d","w","a","e"],true
    include_examples "winning_condition",["q","d"],false
    include_examples "winning_condition",["q","d","c","x","z"],false
    include_examples "winning_condition",["a","q","s","c","d"],true
    include_examples "winning_condition",["z","q","x","e","c"],true
    include_examples "winning_condition",["q","s","d","c","a"],false
    include_examples "winning_condition",["c","a","s","e","q"],true
    include_examples "winning_condition",["z","q","x","e","c"],true
    include_examples "winning_condition",["a","d","c","x","z"],false
    include_examples "winning_condition",["a","d","c","e","z"],false
    include_examples "winning_condition",["a","q","s","c","d","e"],true
    
end

RSpec.describe "tests the input from user" do 
    include_examples "board_input",0,0,"Q"
    include_examples "board_input",0,1,"W"
    include_examples "board_input",0,2,"E"
    include_examples "board_input",1,0,"A"
    include_examples "board_input",1,1,"S"
    include_examples "board_input",1,2,"D"
    include_examples "board_input",2,0,"Z"
    include_examples "board_input",2,1,"X"
    include_examples "board_input",2,2,"C"
end