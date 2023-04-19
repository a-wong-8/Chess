module Slidable

    HORIZONTAL_DIRS = [
        [0, -1], # left
        [0, 1],  # right
        [-1, 0], # up
        [1, 0]   # down
    ] 

    DIAGONAL_DIRS = [
        [-1, -1], # left up
        [1, 1],   # right down
        [-1, 1],  # right up
        [1, -1]   # left down
    ]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves # list of all possible positions
        collected_moves = []

    end

    
    private
    
    def move_dirs
        raise NotImplementedError # this only executes if not implemented

    end

# this helper method is only responsible for collecting all moves in a given direction
  # the given direction is represented by two args, the combination of a dx and dy
    def moves_in_one_dir(dx, dy)
        collected_moves = []
        next_position = true  
        position = self.pos
        # get the piece's current row and current column
        
        until next_position == false 
            position[0] += dx 
            position[1] += dy 
            if position[0].between(0, 7) && position[1].between(0, 7) && (position.empty?)
                collected_moves << position
            elsif position[0].between(0, 7) && position[1].between(0, 7) && position.color != self.color
                collected_moves << position 
                next_position = false 
            else
                next_position = false 
            end
        end


    # in a loop:
      # continually increment the piece's current row and current column to generate a new position
      # stop looping if the new position is invalid (not on the board); the piece can't move in this direction
      # if the new position is empty, the piece can move here, so add the new position to the moves array
      # if the new position is occupied with a piece of the opposite color, the piece can move here (to capture the opposing piece), so add the new position to the moves array
        # but, the piece cannot continue to move past this piece, so stop looping
      # if the new position is occupied with a piece of the same color, stop looping

    # return the final moves array
        collected_moves
    end

end
