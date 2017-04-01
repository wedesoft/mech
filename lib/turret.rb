require 'core_extensions/matrix'


class Turret
  def initialize base, offset, direction = 0
    @base = base
    @offset = offset
    @direction = direction
  end

  def position
    @base.position + Matrix.rotation(@base.direction) * @offset
  end

  def direction
    @base.direction + @direction
  end
end
