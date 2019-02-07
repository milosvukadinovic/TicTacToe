
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
# RSpec.describe Game do

#     before Game do 
#         @player1 = Player.new('John','X')
#         @player2 = Player.new('Doe','O')
#         @game = Game.new(@player1,@player2) 
#     end
           

#     describe '#set_board_value' do 
    

#         it 'Adds X to [0,0] position of the board' do
           
#             @game.current_player_move = @player1
#             @game.set_board_value("Q")
#             game_array = @game.board_array 

#             expect(game_array[0][0]).to eq(@game.current_player_move.mark)
#         end
        
#         it'Adds O to [0,2] position of the board' do
#             @game.current_player_move = @player2
            
#             @game.set_board_value("E")
            
#             game_array = @game.board_array

#             expect(game_array[0][2]).to eq(@game.current_player_move.mark)
#         end
#         # TODO add more tests 
#         it'Adds X to [1,1] position of the board' do
#             @game.current_player_move = @player1
            
#             @game.set_board_value("S")
            
#             game_array = @game.board_array

#             expect(game_array[1][1]).to eq(@game.current_player_move.mark)
#         end
#         it'Adds O to [2,2] position of the board' do
#             @game.current_player_move = @player2
            
#             @game.set_board_value("C")
            
#             game_array = @game.board_array

#             expect(game_array[2][2]).to eq(@game.current_player_move.mark)
#         end

#         it'Adds O to [1,2] position of the board' do
#             @game.current_player_move = @player2
            
#             @game.set_board_value("D")
            
#             game_array = @game.board_array

#             expect(game_array[1][2]).to eq(@game.current_player_move.mark)
#         end
#         it'Adds X to [2,0] position of the board' do
#             @game.current_player_move = @player1
            
#             @game.set_board_value("Z")
            
#             game_array = @game.board_array

#             expect(game_array[2][0]).to eq(@game.current_player_move.mark)
#         end

#     end

#     describe '#check_if_win' do
#         it 'Should return true first horizontal line [X],[X],[X]' do 
#             arr = ['X','X','X']
#             @game.board_array[0] = arr
#             expect(@game.check_if_win).to eq(true)
#         end
#         it 'Should return true second horizontal line [X],[X],[X]' do 
#             arr = ['X','X','X']
#             @game.board_array[1] = arr
#             expect(@game.check_if_win).to eq(true)
#         end
#         it 'Should return true third horizontal line [X],[X],[X]' do 
#             arr = ['X','X','X']
#             @game.board_array[2] = arr
#             expect(@game.check_if_win).to eq(true)
#         end
#         it 'Should return true first vertical line [X],[X],[X]' do 
#             arr = ['X','X','X']
#             @game.board_array[0][0] = arr[0]
#             @game.board_array[0][1] = arr[0]
#             @game.board_array[0][2] = arr[0]
#             expect(@game.check_if_win).to eq(true)
#         end
#         it 'Should return true second vertical line [X],[X],[X]' do 
#             arr = ['X','X','X']
#             @game.board_array[1][0] = arr[0]
#             @game.board_array[1][1] = arr[0]
#             @game.board_array[1][2] = arr[0]
#             expect(@game.check_if_win).to eq(true)
#         end
#         it 'Should return true third vertical line [X],[X],[X]' do 
#             arr = ['X','X','X']
#             @game.board_array[2][0] = arr[0]
#             @game.board_array[2][1] = arr[0]
#             @game.board_array[2][2] = arr[0]
#             expect(@game.check_if_win).to eq(true)
#         end
#         it 'Should return true first diagonal line [X],[X],[X]' do 
#             arr = ['X','X','X']
#             @game.board_array[0][0] = arr[0]
#             @game.board_array[1][1] = arr[0]
#             @game.board_array[2][2] = arr[0]
#             expect(@game.check_if_win).to eq(true)
#         end
#         it 'Should return true second diagonal line [X],[X],[X]' do 
#             arr = ['X','X','X']
#             @game.board_array[0][2] = arr[0]
#             @game.board_array[1][1] = arr[0]
#             @game.board_array[2][0] = arr[0]
#             expect(@game.check_if_win).to eq(true)
#         end

#         # First horizontal row
#         it 'Should return false first horizontal row  [O],[X],[O]' do 
#             arr = ['O','X','O']
#             @game.board_array[0]=arr
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false first horizontal row  [X],[X],[O]' do 
#             arr = ['X','X','O']
#             @game.board_array[0]=arr
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false first horizontal row  [O],[X],[X]' do 
#             arr = ['O','X','X']
#             @game.board_array[0]=arr
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false first horizontal row  [O],[X],[O]' do 
#             arr = ['O','X','O']
#             @game.board_array[0]=arr
#             expect(@game.check_if_win).not_to eq(true)
#         end

#         # Second horizontal row
#         it 'Should return false second horizontal row  [O],[X],[O]' do 
#             arr = ['O','X','O']
#             @game.board_array[1]=arr
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false second horizontal row  [X],[X],[O]' do 
#             arr = ['X','X','O']
#             @game.board_array[1]=arr
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false second horizontal row  [O],[X],[X]' do 
#             arr = ['O','X','X']
#             @game.board_array[1]=arr
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false second horizontal row  [O],[X],[O]' do 
#             arr = ['O','X','O']
#             @game.board_array[1]=arr
#             expect(@game.check_if_win).not_to eq(true)
#         end

#         # Third horizontal row
#         it 'Should return false third horizontal row  [O],[X],[O]' do 
#             arr = ['O','X','O']
#             @game.board_array[2]=arr
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false third horizontal row  [X],[X],[O]' do 
#             arr = ['X','X','O']
#             @game.board_array[2]=arr
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false third horizontal row [O],[X],[X]' do 
#             arr = ['O','X','X']
#             @game.board_array[2]=arr
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false third horizontal row  [O],[X],[O]' do 
#             arr = ['O','X','O']
#             @game.board_array[1]=arr
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         # First vertical row
#         it 'Should return false first vertical row  [X],[O],[X]' do 
            
#             @game.board_array[0][0]= "X"
#             @game.board_array[1][0]= "O"
#             @game.board_array[2][0]= "X"
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false first vertical row  [X],[X],[O]' do 
            
#             @game.board_array[0][0]= "X"
#             @game.board_array[1][0]= "X"
#             @game.board_array[2][0]= "O"
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false first vertical row  [O],[O],[X]' do 
            
#             @game.board_array[0][0]= "O"
#             @game.board_array[1][0]= "O"
#             @game.board_array[2][0]= "X"
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false first vertical row  [O],[X],[O]' do 
#             @game.board_array[0][0]= "O"
#             @game.board_array[1][0]= "X"
#             @game.board_array[2][0]= "O"
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         # Second vertical row
#         it 'Should return false second vertical row  [X],[O],[X]' do 
            
#             @game.board_array[0][1]= "X"
#             @game.board_array[1][1]= "O"
#             @game.board_array[2][1]= "X"
#             expect(@game.check_if_win).not_to eq(true)
#         end

#         it 'Should return false second vertical row  [X],[X],[O]' do 
            
#             @game.board_array[0][1]= "X"
#             @game.board_array[1][1]= "X"
#             @game.board_array[2][1]= "O"
#             expect(@game.check_if_win).not_to eq(true)
#         end

#         it 'Should return false second vertical row  [O],[O],[X]' do 
            
#             @game.board_array[0][1]= "O"
#             @game.board_array[1][1]= "O"
#             @game.board_array[2][1]= "X"
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false second vertical row  [O],[X],[O]' do 
            
#             @game.board_array[0][1]= "O"
#             @game.board_array[1][1]= "X"
#             @game.board_array[2][1]= "O"
#             expect(@game.check_if_win).not_to eq(true)
#         end
#          # Third vertical row
    
#          it 'Should return false third vertical row  [X],[O],[X]' do 
            
#             @game.board_array[0][2]= "X"
#             @game.board_array[1][2]= "O"
#             @game.board_array[2][2]= "X"
#             expect(@game.check_if_win).not_to eq(true)
#         end

#         it 'Should return false third vertical row  [X],[X],[O]' do 
            
#             @game.board_array[0][2]= "X"
#             @game.board_array[1][2]= "X"
#             @game.board_array[2][2]= "O"
#             expect(@game.check_if_win).not_to eq(true)
#         end

#         it 'Should return false third vertical row  [O],[O],[X]' do 
            
#             @game.board_array[0][2]= "O"
#             @game.board_array[1][2]= "O"
#             @game.board_array[2][2]= "X"
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false third vertical row  [O],[X],[O]' do 
            
#             @game.board_array[0][2]= "O"
#             @game.board_array[1][2]= "X"
#             @game.board_array[2][2]= "O"
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         #First diagonal
#         it 'Should return false first diagonal row  [X],[X],[O]' do 
            
#             @game.board_array[0][0]= "X"
#             @game.board_array[1][1]= "X"
#             @game.board_array[2][2]= "O"
#             expect(@game.check_if_win).not_to eq(true)
#         end

#         it 'Should return false first diagonal row   [O],[O],[X]' do 
            
#             @game.board_array[0][0]= "O"
#             @game.board_array[1][1]= "O"
#             @game.board_array[2][2]= "X"
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false first diagonal row  [O],[X],[O]' do 
            
#             @game.board_array[0][0]= "O"
#             @game.board_array[1][1]= "X"
#             @game.board_array[2][2]= "O"
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         #Second diagonal
#         it 'Should return false second diagonal row  [X],[X],[O]' do 
            
#             @game.board_array[0][2]= "X"
#             @game.board_array[1][1]= "X"
#             @game.board_array[2][0]= "O"
#             expect(@game.check_if_win).not_to eq(true)
#         end

#         it 'Should return false second diagonal row   [O],[O],[X]' do 
            
#             @game.board_array[0][2]= "O"
#             @game.board_array[1][1]= "O"
#             @game.board_array[2][0]= "X"
#             expect(@game.check_if_win).not_to eq(true)
#         end
#         it 'Should return false second diagonal row  [O],[X],[O]' do 
            
#             @game.board_array[0][2]= "O"
#             @game.board_array[1][1]= "X"
#             @game.board_array[2][0]= "O"
#             expect(@game.check_if_win).not_to eq(true)
#         end
    
    
#         end



    
# end