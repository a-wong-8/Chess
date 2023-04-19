
class Piece 
    attr_reader :color, :board
    attr_accessor :pos 
    
    def initialize(color, board, pos)
        @color = color 
        @board = board
        @pos = pos
    end

    def empty? 
        if self.color == nil 
            return true 
        else
            false 
        end
    end

    def pos=(value)
        pos = value
    end

    def to_s

    end

end