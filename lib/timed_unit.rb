require 'unit'


class TimedUnit < Unit
  def initialize life_time, position, speed = Vector[0, 0], direction = 0
    super position, speed, direction
    @life_time = life_time
    @time = 0
  end

  def relative_age
    @time / @life_time
  end

  def finish
    []
  end

  def update dt, joystick
    @time += dt
    @time < @life_time ? super : finish
  end
end
