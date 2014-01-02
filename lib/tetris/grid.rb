module Tetris
  class Grid
    attr_accessor :active_shape

    def initialize(columns, rows)
      @grid = Array.new(rows) { Array.new(columns) }
      @x = columns / 2
      @y = 0
      @active_piece = Piece.new
    end

    def new_piece(piece)
      
    end

    def move_down
      unless hit_bottom? || hit_other_piece?
        remove_active_shape
        @y += 1
        place_active_shape
      end
    end

    def move_left
      unless hit_left_side?
        remove_active_shape
        @x -= 1
        place_active_shape
      end
    end

    def move_right
      unless hit_right_side?
        remove_active_shape
        @x += 1
        place_active_shape
      end
    end

    def rotate
    end

    private

    def remove_active_shape
      @active_piece.shape.each_with_index do |row, y|
        row.each_with_index do |block, x|
          @grid[@x + x][@y + y] = nil unless block.nil?
        end
      end
    end

    def place_active_shape
      @active_piece.shape.each_with_index do |row, y|
        row.each_with_index do |block, x|
          @grid[@x + x][@y + y] = [true, @active_piece.color]
        end
      end
    end

    def hit_bottom?
      @y == 0
    end

    def hit_other_piece?
      false
    end

    def hit_left_side?
      @x == 0
    end

    def hit_right_side?
      @x + @active_piece.width == @grid[0].size
    end
  end
end