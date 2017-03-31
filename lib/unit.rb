class Unit
  attr_reader :position
  attr_reader :speed
  attr_reader :direction

  def initialize position, speed = Vector[0, 0], direction = 0
    @position = position
    @speed = speed
    @direction = direction
  end

  def update dt, joystick
    @position += @speed * dt
    [self]
  end
end
