class Unit
  attr_reader :position
  attr_reader :direction

  def initialize position, direction = 0
    @position = position
    @direction = direction
  end

  def age
    0
  end

  def update dt, joystick
  end
end
