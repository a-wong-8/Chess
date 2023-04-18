require_relative "piece.rb"
class Board
    
    def initialize
        @board = Array.new(8) {Array.new(8)}
       fill_board(@board)
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

    def add_pieces

        dup_board = @board.dup

        color_hash = {:white => "w",
        :black => "b"
    }

        piece_hash = { :rook => "R",
        :knight => "N",
        :bishop => "B",
        :queen => "Q",
        :king => "K",
        :pawn => "P",
        :null_piece => " "
        }
       
        (0..7).each do |x|
            (0..7).each do |y|
                dup_board[x][y] = piece_hash[dup_board[x][y].type_piece] 
            end
        end
    end

    def print_board
        @board.each do |row|
            puts row.join(" ")
        end
        puts 'board has been printed'
    end

    def move_piece(start_pos, end_pos)
        if self[end_pos] == ' '
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]    
        end

    end

end