require 'timed_unit'


class Explosion < TimedUnit
  LIFE_TIME = 0.5

  def initialize position
    super LIFE_TIME, position
  end
end
