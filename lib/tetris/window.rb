require "gosu"
require "pry"

module Tetris
  class Window < Gosu::Window
    def initialize
      super(WIDTH, HEIGHT, false)
      self.caption = "Tetris"
      @background = Gosu::Image.new(self, "media/images/background.png", true)
      @playing_field = PlayingField.new(self)
      @frame = 0;
    end

    def update
      @frame += 1
      @playing_field.move_down if @frame % 30 == 0

      if @frame % 3 == 0
        if button_down?(Gosu::KbLeft) || button_down?(Gosu::GpLeft)
          @playing_field.move_left
        end
        if button_down?(Gosu::KbRight) || button_down?(Gosu::GpRight)
          @playing_field.move_right
        end
        if button_down?(Gosu::KbDown) || button_down?(Gosu::GpDown)
          @playing_field.move_down
        end
      end

      if @frame % 6 == 0
        if button_down?(Gosu::KbUp) || button_down?(Gosu::GpUp)
          @playing_field.rotate
        end
      end
    end

    def draw
      @background.draw(0, 0, ZOrder::Background)
      @playing_field.draw
    end

    def button_down(id)
      close if id == Gosu::KbEscape
    end
  end
end