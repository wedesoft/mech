require 'core_extensions/matrix'


class Bullet
  SPEED = 500
  LIFE_TIME = 0.5

  attr_reader :position

  def initialize position, direction
    @position = position
    @speed = Matrix.rotation(direction) * Vector[SPEED, 0]
    @time = LIFE_TIME
  end

  def update dt
    @position += @speed * dt
    @time -= dt
  end

  def live?
    @time >= 0
  end
end
