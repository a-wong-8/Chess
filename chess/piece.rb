
class Piece 
    attr_reader :color, :type_piece
    attr_accessor :pos 
    
    def initialize(type_piece, color, pos)
        @color = color 
        @type_piece = type_piece
        @pos = pos
    end

    def moves
        
    end



end