require_relative "piece.rb"

class Queen < Piece
    include Slidable

    def move_dirs
        horizontal_moves = [[0, -1], [0, 1]]
    end

    def symbol
        ♕
    end

end
