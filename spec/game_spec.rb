require './game.rb'
require './player.rb'

RSpec.describe Game do

    before Game do 
        @player1 = Player.new('John','X')
        @player2 = Player.new('Doe','O')
        @game = Game.new(@player1,@player2) 
    end
           

    describe '#set_board_value' do 
    

        it 'Adds X to [0,0] position of the board' do
           
            @game.current_player_move = @player1
            @game.set_board_value("Q")
            game_array = @game.board_array 

            expect(game_array[0][0]).to eq(@game.current_player_move.mark)
        end
        
        it'Adds O to [0,2] position of the board' do
            @game.current_player_move = @player2
            
            @game.set_board_value("E")
            
            game_array = @game.board_array

            expect(game_array[0][2]).to eq(@game.current_player_move.mark)
        end
        # TODO add more tests 

    end

    describe '#check_if_win' do
        it 'Should return true first horizontal line [X],[X],[X]' do 
            arr = ['X','X','X']
            @game.board_array[0] = arr
            expect(@game.check_if_win).to eq(true)
        end
        it 'Should return true second horizontal line [X],[X],[X]' do 
            arr = ['X','X','X']
            @game.board_array[1] = arr
            expect(@game.check_if_win).to eq(true)
        end
        it 'Should return true third horizontal line [X],[X],[X]' do 
            arr = ['X','X','X']
            @game.board_array[2] = arr
            expect(@game.check_if_win).to eq(true)
        end
        
    end



    
end