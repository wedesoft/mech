require 'core_extensions/matrix'
require 'explosion'
require 'unit'


class Bullet < Unit
  SPEED = 500
  LIFE_TIME = 0.5

  def initialize position, direction
    super position
    @speed = Matrix.rotation(direction) * Vector[SPEED, 0]
    @time = LIFE_TIME
  end

  def explode
    Explosion.new @position
  end

  def update dt, joystick
    @position += @speed * dt
    @time -= dt
    @time >= 0 ? [self] : [explode]
  end
end
