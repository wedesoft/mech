require 'core_extensions/matrix'
require 'core_extensions/numeric'
require 'turret'
require 'unit'


class Mech < Unit
  MAX_SPEED = 100.0
  TURN_RATE = 2 * Math::PI / 4
  TURRET_TURN_RATE = 2 * Math::PI
  ACCELERATION = 50

  attr_reader :turret

  def initialize position
    super position
    @turret = Turret.new self, Vector[-20, -20]
  end

  def update dt, joystick
    if joystick
      nominal_speed = joystick.axes.norm * MAX_SPEED / Joystick::MAX_AXIS
      nominal_direction = joystick.axes.angle
      nominal_turret_direction = joystick.turret_axes.angle
    else
      nominal_speed = 0
      nominal_direction = 0
      nominal_turret_direction = 0
    end
    speed_norm = @speed.norm
    speed_change = (nominal_speed - speed_norm).limit ACCELERATION * dt
    direction_change = (nominal_direction - @direction).limit_angle TURN_RATE * dt
    @direction = (@direction + direction_change) % (2 * Math::PI)
    turret_direction_change = (nominal_turret_direction - @turret.direction).limit_angle TURRET_TURN_RATE * dt
    @turret.instance_eval { @direction = (@direction + turret_direction_change) % (2 * Math::PI) }
    speed_norm += speed_change
    @speed = Matrix.rotation(@direction) * Vector[speed_norm, 0]
    super dt, joystick
  end

  def nozzle_position
    @turret.position + Matrix.rotation(@turret.direction) * Vector[32, 0]
  end
end
