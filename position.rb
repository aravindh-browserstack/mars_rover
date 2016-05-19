# Represents the absolute position
# of an object identified by (x,y)
# and direction.

require './direction'
include Direction

module Position
  class PositionClass
    def initialize(x,y,d)
      @x_val = x
      @y_val = y
      @dir = DirectionClass.new(d)
    end

    def to_s
      return @x_val.to_s+" "+@y_val.to_s+" "+@dir.to_s
    end

    def move_forward()
      case @dir.to_s
        when "N"
          @y_val += 1
        when "S"
          @y_val -= 1
        when "E"
          @x_val += 1
        when "W"
          @x_val -= 1
      end
    end

    def turn_left()
      @dir.switch_to_left
    end

    def turn_right()
      @dir.switch_to_right
    end

    def fell_off?(edge_x,edge_y)
      if @x_val < 0 || @x_val > edge_x
        return true
      end
      if @y_val < 0 || @y_val > edge_y
        return true
      end
      return false
    end
  end
end

