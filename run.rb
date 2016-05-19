require './position'
require './rover'
include Position
include Rover

inp_lines = gets(nil)
inp_lines = inp_lines.lines()
inp_lines = inp_lines.map { |l| l.chomp() } 
plateau_x,plateau_y = inp_lines[0].split(" ")
plateau_x = plateau_x.to_i
plateau_y = plateau_y.to_i

index = 1
while index < inp_lines.length
  pos = inp_lines[index]
  rover = RoverRunnerClass.new(pos)
  rover.set_edge(plateau_x,plateau_y)
  index += 1
  movements = inp_lines[index]
  break if movements == nil
  rover.set_movements(movements)
  puts rover.track_rover()
  index += 1
end
  
