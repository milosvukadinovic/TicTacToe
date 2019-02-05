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
        it'Adds X to [1,1] position of the board' do
            @game.current_player_move = @player1
            
            @game.set_board_value("S")
            
            game_array = @game.board_array

            expect(game_array[1][1]).to eq(@game.current_player_move.mark)
        end
        it'Adds O to [2,2] position of the board' do
            @game.current_player_move = @player2
            
            @game.set_board_value("C")
            
            game_array = @game.board_array

            expect(game_array[2][2]).to eq(@game.current_player_move.mark)
        end

        it'Adds O to [1,2] position of the board' do
            @game.current_player_move = @player2
            
            @game.set_board_value("D")
            
            game_array = @game.board_array

            expect(game_array[1][2]).to eq(@game.current_player_move.mark)
        end
        it'Adds X to [2,0] position of the board' do
            @game.current_player_move = @player1
            
            @game.set_board_value("Z")
            
            game_array = @game.board_array

            expect(game_array[2][0]).to eq(@game.current_player_move.mark)
        end

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
        it 'Should return true first vertical line [X],[X],[X]' do 
            arr = ['X','X','X']
            @game.board_array[0][0] = arr[0]
            @game.board_array[0][1] = arr[0]
            @game.board_array[0][2] = arr[0]
            expect(@game.check_if_win).to eq(true)
        end
        it 'Should return true second vertical line [X],[X],[X]' do 
            arr = ['X','X','X']
            @game.board_array[1][0] = arr[0]
            @game.board_array[1][1] = arr[0]
            @game.board_array[1][2] = arr[0]
            expect(@game.check_if_win).to eq(true)
        end
        it 'Should return true third vertical line [X],[X],[X]' do 
            arr = ['X','X','X']
            @game.board_array[2][0] = arr[0]
            @game.board_array[2][1] = arr[0]
            @game.board_array[2][2] = arr[0]
            expect(@game.check_if_win).to eq(true)
        end
        it 'Should return true first diagonal line [X],[X],[X]' do 
            arr = ['X','X','X']
            @game.board_array[0][0] = arr[0]
            @game.board_array[1][1] = arr[0]
            @game.board_array[2][2] = arr[0]
            expect(@game.check_if_win).to eq(true)
        end
        it 'Should return true second diagonal line [X],[X],[X]' do 
            arr = ['X','X','X']
            @game.board_array[0][2] = arr[0]
            @game.board_array[1][1] = arr[0]
            @game.board_array[2][0] = arr[0]
            expect(@game.check_if_win).to eq(true)
        end

        it 'Should return false  [O],[X],[O]' do 
            arr = ['O','X','O']
            @game.board_array[0]=arr
            expect(@game.check_if_win).not_to eq(true)
        end
        it 'Should return false  [X],[X],[O]' do 
            arr = ['X','X','O']
            @game.board_array[0]=arr
            expect(@game.check_if_win).not_to eq(true)
        end
        it 'Should return false  [O],[X],[X]' do 
            arr = ['O','X','X']
            @game.board_array[1]=arr
            expect(@game.check_if_win).not_to eq(true)
        end
        it 'Should return false  [o],[X],[O]' do 
            arr = ['O','X','O']
            @game.board_array[2]=arr
            expect(@game.check_if_win).not_to eq(true)
        end


        
    end



    
end