
class Piece 
    attr_reader :color, :type_piece
    attr_accessor :pos 
    
    def initialize(color, board, pos)
        @color = color 
        @board = Board
        @pos = pos
    end

end