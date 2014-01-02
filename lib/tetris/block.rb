module Tetris
  class Block
    attr_accessor :x, :y

    def initialize(window, color, coordinates)
      @image = Gosu::Image.new(window, "media/images/element_#{color}_square.png", true)
      @x = coordinates[:x]
      @y = coordinates[:y]
    end

    def draw
      @image.draw(@x, @y, ZOrder::Blocks)
    end
  end
end