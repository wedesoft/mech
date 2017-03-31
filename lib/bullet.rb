require 'core_extensions/matrix'
require 'explosion'
require 'timed_unit'


class Bullet < TimedUnit
  SPEED = 500
  LIFE_TIME = 0.5

  def initialize position, direction
    super LIFE_TIME, position, Matrix.rotation(direction) * Vector[SPEED, 0], direction
  end

  def finish
    [Explosion.new(@position)]
  end
end
