module Tetris
  class PlayingField
    def initialize(window)
      @window = window
      @pieces = []
      new_piece
    end

    def new_piece
      @pieces << Piece.new(@window, PIECES.keys.sample, COLORS.sample, {x: WIDTH / 2, y: 0})
    end

    def draw
      @pieces.each { |piece| piece.draw }
    end

    def active_piece
      @pieces.last
    end

    def move_left
      unless hit_left_wall? || hit_another_piece_from_right?
        active_piece.move_left
      end
    end

    def move_right
      unless hit_right_wall? || hit_another_piece_from_left?
        active_piece.move_right
      end
    end

    def rotate
      active_piece.rotate
    end

    def move_down
      unless hit_bottom? || hit_another_piece_from_top?
        active_piece.move_down
      else
        new_piece
      end
    end

    private

    def hit_bottom?
      active_piece.y == HEIGHT - BLOCK_SIZE
    end

    def hit_another_piece_from_top?
      active_piece.blocks.any? do |block|
        @pieces[0...-1].any? do |piece|
          piece.blocks.any? do |other_block|
            block.y == other_block.y - BLOCK_SIZE && block.x == other_block.x
          end
        end
      end
    end

    def hit_left_wall?
      active_piece.x == 0
    end

    def hit_another_piece_from_right?
      active_piece.blocks.any? do |block|
        @pieces[0...-1].any? do |piece|
          piece.blocks.any? do |other_block|
            block.y == other_block.y && block.x == other_block.x + BLOCK_SIZE
          end
        end
      end
    end

    def hit_right_wall?
      active_piece.blocks.map { |block| block.x }.max == WIDTH - BLOCK_SIZE
    end

    def hit_another_piece_from_left?
      active_piece.blocks.any? do |block|
        @pieces[0...-1].any? do |piece|
          piece.blocks.any? do |other_block|
            block.y == other_block.y && block.x == other_block.x - BLOCK_SIZE
          end
        end
      end
    end
  end
end