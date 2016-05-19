# Wrapper class to trigger
# movement for the rover

require "./position"
include Position

module Rover
  class RoverRunnerClass
    def initialize(start_pos)
      start_x,start_y,start_dir = start_pos.split(" ")
      start_x = start_x.to_i
      start_y = start_y.to_i
      @position = PositionClass.new(start_x,start_y,start_dir)
    end

    def set_edge(edge_x,edge_y)
      @edge_x = edge_x
      @edge_y = edge_y
    end

    def set_movements(m)
      @movements = m
    end

    def track_rover()  
      fell_off = false
      @movements.each_byte { |c|
        case c.chr
          when "L"
            @position.turn_left
          when "R"
            @position.turn_right
          when "M"
            prev_pos = @position.to_s
            @position.move_forward
            if @position.fell_off?(@edge_x,@edge_y)
              puts "Last known location: #{prev_pos} before rover fell off"
              return prev_pos
            end
          else
            puts "Unrecognized movement characters !"
        end
      }
      return @position.to_s
      end
  end
end

