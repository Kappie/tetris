module Tetris
  class Piece
    attr_accessor :x, :y
    attr_reader :height, :width, :blocks

    def initialize(window, shape, color, coordinates)
      @x = coordinates[:x]
      @y = coordinates[:y]

      @blocks = []
      PIECES[shape][1].reverse.each_with_index do |rows, y_offset|
        rows.each_with_index do |block, x_offset|
          unless block.nil?
            @blocks << Block.new(window, color, {x: @x + x_offset * BLOCK_SIZE, y: @y - y_offset * BLOCK_SIZE})
          end
        end
      end
    end

    def draw
      @blocks.each { |block| block.draw }
    end

    def move_down
      @y += BLOCK_SIZE
      @blocks.each { |block| block.y += BLOCK_SIZE; block.draw }
    end

    def move_left
      @x -= BLOCK_SIZE
      @blocks.each { |block| block.x -= BLOCK_SIZE; block.draw }
    end

    def move_right
      @x += BLOCK_SIZE
      @blocks.each { |block| block.x += BLOCK_SIZE; block.draw }
    end

  end
end