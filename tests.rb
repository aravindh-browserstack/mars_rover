# Unit tests for the rover class

require 'test/unit'
require 'test/unit/assertions'
require 'test/unit/ui/console/testrunner'
require './rover'

include Rover

class TC_MyTest < Test::Unit::TestCase
  def test_positive_one
    rover = RoverRunnerClass.new("1 2 N")
    rover.set_edge(5,5)
    rover.set_movements("LMLMLMLMM")
    assert_equal("1 3 N",rover.track_rover)
  end

  def test_positive_two
    rover = RoverRunnerClass.new("3 3 E")
    rover.set_edge(5,5)
    rover.set_movements("MMRMMRMRRM")
    assert_equal("5 1 E",rover.track_rover)
  end

  def test_negative_one
    rover = RoverRunnerClass.new("2 5 N")
    rover.set_edge(5,5)
    rover.set_movements("MMMM")
    assert_equal("2 5 N",rover.track_rover)
  end
  
  def test_negative_two
    rover = RoverRunnerClass.new("2 2 N")
    rover.set_edge(5,5)
    rover.set_movements("LMMM")
    assert_equal("0 2 W",rover.track_rover)
  end

  def test_invalid_direction
    assert_raise RuntimeError do
      rover = RoverRunnerClass.new("2 2 X")
    end
  end
end


Test::Unit::UI::Console::TestRunner.run(TC_MyTest)

