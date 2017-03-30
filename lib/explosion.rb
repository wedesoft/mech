require 'unit'


class Explosion < Unit
  LIFE_TIME = 2

  def initialize position
    super position
    @time = LIFE_TIME
  end

  def update dt, joystick
    @time -= dt
    @time >= 0 ? [self] : []
  end
end
