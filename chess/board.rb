require_relative "piece.rb"
class Board
    

    def initialize
        @board = Array.new(8) {Array.new(8)}
        fill_board(@board)
        print(@board)
    end
    def [](position)
        row, col = position
        @board[row][col]
    end
    def []=(position, value)
        row, col = position
        @board[row][col] = value 
    end
    def fill_board(board)
        black_rook = Piece.new(:rook, :black)
        board[[0,0]] = black_rook.type_piece
        board[0,1] = Piece.new(:knight, :black) 
        board[0,2] = Piece.new(:bishop, :black)
        board[0,3] = Piece.new(:queen, :black)
        board[0,4] = Piece.new(:king, :black) 
        board[0,5] = Piece.new(:bishop, :black)
        board[0,6] = Piece.new(:knight, :black)
        board[0,7] = Piece.new(:rook, :black)
        board[7,0] = Piece.new(:rook, :white)
        board[7,1] = Piece.new(:knight, :white)
        board[7,2] = Piece.new(:bishop, :white)
        board[7,3] = Piece.new(:queen, :white) 
        board[7,4] = Piece.new(:king, :white)
        board[7,5] = Piece.new(:bishop, :white)
        board[7,6] = Piece.new(:knight, :white)
        board[7,7] = Piece.new(:rook, :white)
        (0..7).each do |x|
            board[1,x] = Piece.new(:pawn, :black)
            board[6,x] = Piece.new(:pawn, :white)
        end
        (2..5).each do |x|
            (0..7).each do |y|
              board[x,y] = Piece.new(:null_piece, :null)
            end
        end
    end
    def print(board)
        board.each do |row|
            puts row.join(" ")
        end
    end
end