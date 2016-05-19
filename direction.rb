# Represents a direction instance
# and methods to manipulate the 
# current direction

module Direction
  $dirs = [:north,:east,:south,:west]
  $dir_values = {
    north:0,
    east: 1,
    south:2,
    west: 3
    } 
      
  class DirectionClass
    def initialize(cur)
      case cur
        when "N"
          @current = :north
        when "E"
          @current = :east
        when "W"
          @current = :west
        when "S"
          @current = :south
        else
          raise RuntimeError, "Invalid direction value"
        end
    end
   
    def to_s
      case @current
        when :north
          "N"
        when :south
          "S"
        when :east
          "E"
        when :west
          "W"
      end 
    end

    def switch_to_left()
      req_direction = ($dir_values[@current]-1)%($dir_values.size)
      @current = $dirs[req_direction]
    end

    def switch_to_right()
      req_direction = ($dir_values[@current]+1)%($dir_values.size)
      @current = $dirs[req_direction]
    end
  end    
end
  
