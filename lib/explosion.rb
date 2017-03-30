require 'unit'


class Explosion < Unit
  LIFE_TIME = 0.5

  def initialize position
    super position
    @time = 0
  end

  def relative_age
    @time / LIFE_TIME
  end

  def update dt, joystick
    @time += dt
    @time < LIFE_TIME ? [self] : []
  end
end
