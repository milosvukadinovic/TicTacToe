class Player
    attr_accessor :name , :mark 


    
    def initialize(name,mark)
        @name = name
        @mark = mark
    end

    def show_user
        puts "#{name} #{mark}" 
    end
end