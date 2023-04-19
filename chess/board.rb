require_relative "pieces.rb"
class Board
    
    def initialize
        @grid = Array.new(8) {Array.new(8)}
        @null_piece = NullPiece.instance 
       fill_board(@grid)
    #    add_pieces
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value 
    end

    def fill_board(board)
        self[[0,0]] = Rook.new(:black, self, [0,0])
        self[[0,1]] = Knight.new(:black, self, [0,1]) 
        self[[0,2]] = Bishop.new(:black, self, [0,2])
        self[[0,3]] = Queen.new(:black, self, [0,3])
        self[[0,4]] = King.new(:black, self, [0,4]) 
        self[[0,5]] = Bishop.new(:black, self, [0,5])
        self[[0,6]] = Knight.new(:black, self, [0,6])
        self[[0,7]] = Rook.new(:black, self, [0,7])
        self[[7,0]] = Rook.new(:white, self, [7,0])
        self[[7,1]] = Knight.new(:white, self, [7,1])
        self[[7,2]] = Bishop.new(:white, self, [7,2])
        self[[7,3]] = Queen.new(:white, self, [7,3]) 
        self[[7,4]] = King.new(:white, self, [7,4])
        self[[7,5]] = Bishop.new(:white, self, [7,5])
        self[[7,6]] = Knight.new(:white, self, [7,6])
        self[[7,7]] = Rook.new(:white, self, [7,7])
        (0..7).each do |x|
            self[[1,x]] = Pawn.new(:black, self, [1,x])
            self[[6,x]] = Pawn.new(:white, self, [6,x])
        end
        (2..5).each do |x|
            (0..7).each do |y|
                self[[x,y]] = @null_piece
            end
        end
    end

    # def add_pieces

    #     @dup_board = @board.map {|subarray| subarray.dup}

    #     color_hash = {:white => "w",
    #     :black => "b"
    #     }

    #     piece_hash = { :rook => "R",
    #     :knight => "N",
    #     :bishop => "B",
    #     :queen => "Q",
    #     :king => "K",
    #     :pawn => "P",
    #     :null_piece => " "
    #     }
       
    #     (0..7).each do |x|
    #         (0..7).each do |y|
    #             @dup_board[x][y] = piece_hash[@dup_board[x][y].type_piece] 
    #         end
    #     end

    # end

    def print_board
        # @dup_board = @board.map {|subarray| subarray.dup}

        # color_hash = {:white => "w",
        # :black => "b"
        # }

        # piece_hash = { :rook => "R",
        # :knight => "N",
        # :bishop => "B",
        # :queen => "Q",
        # :king => "K",
        # :pawn => "P",
        # :null_piece => " "
        # }

       final_array = []
        (0..7).each do |x|
            sub_array = []
            (0..7).each do |y|
                sub_array << @grid[x][y].symbol
            end
            final_array << sub_array
        end
        final_array.each do |row|
            puts row.join(" ")
        end
        puts 'board has been printed'
    end

    def move_piece(start_pos, end_pos)
        raise 'invalid position' if !start_pos.first.between?(0,7) || !start_pos.last.between?(0,7) || !end_pos.first.between?(0,7) || !end_pos.last.between?(0,7)
        
        if self[end_pos].symbol == " " 
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]    
        self[start_pos].pos, self[end_pos].pos = self[end_pos].pos, self[start_pos].pos
        end

    end

end