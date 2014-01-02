module Tetris
  class Piece
    attr_reader :color, :shape, :height, :width, :blocks

    def initialize
      @color = COLORS.sample
      @shape = PIECES[:T]
      @height = @shape.size
      @width = @shape[0].size
    end
  end
end