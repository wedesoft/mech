require 'core_extensions/matrix'
require 'explosion'
require 'timed_unit'


class Bullet < TimedUnit
  SPEED = 500
  LIFE_TIME = 0.5

  def initialize position, direction
    super LIFE_TIME, position, direction
    @speed = Matrix.rotation(direction) * Vector[SPEED, 0]
  end

  def finish
    [Explosion.new(@position)]
  end

  def update dt, joystick
    @position += @speed * dt
    super dt, joystick
  end
end
