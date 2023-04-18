require_relative "piece.rb"
class Board
    
    def initialize
        @board = Array.new(8) {Array.new(8)}
       fill_board(@board)
        # print(@board)
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
        self[[0,0]] = Piece.new(:rook, :black)
        self[[0,1]] = Piece.new(:knight, :black) 
        self[[0,2]] = Piece.new(:bishop, :black)
        self[[0,3]] = Piece.new(:queen, :black)
        self[[0,4]] = Piece.new(:king, :black) 
        self[[0,5]] = Piece.new(:bishop, :black)
        self[[0,6]] = Piece.new(:knight, :black)
        self[[0,7]] = Piece.new(:rook, :black)
        self[[7,0]] = Piece.new(:rook, :white)
        self[[7,1]] = Piece.new(:knight, :white)
        self[[7,2]] = Piece.new(:bishop, :white)
        self[[7,3]] = Piece.new(:queen, :white) 
        self[[7,4]] = Piece.new(:king, :white)
        self[[7,5]] = Piece.new(:bishop, :white)
        self[[7,6]] = Piece.new(:knight, :white)
        self[[7,7]] = Piece.new(:rook, :white)
        (0..7).each do |x|
            self[[1,x]] = Piece.new(:pawn, :black)
            self[[6,x]] = Piece.new(:pawn, :white)
        end
        (2..5).each do |x|
            (0..7).each do |y|
                self[[x,y]] = Piece.new(:null_piece, :null)
            end
        end
    end

    def print_board
        @board.each do |row|
            puts row.join(" ")
        end
        puts 'board has been printed'
    end

end