
class Piece 
    attr_reader :color, :type_piece
    
    def initialize(type_piece, color)
        @color = color 
        @type_piece = type_piece
    end


end