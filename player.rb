class Player
    attr_accessor :name , :mark , :moves

    def initialize (name,mark)
        @name = name
        @mark = mark
    end

    def show_user
        puts "#{name} #{mark}" 
    end
end