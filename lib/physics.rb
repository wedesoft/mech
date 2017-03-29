require 'core_extensions/matrix'
require 'core_extensions/numeric'


class Physics
  MAX_SPEED = 100.0
  TURN_RATE = 2 * Math::PI / 4
  TURRET_TURN_RATE = 2 * Math::PI
  ACCELERATION = 50

  attr_reader :position
  attr_reader :direction

  def initialize position
    @position = position
    @direction = 0
    @speed = 0
    @turret_direction = 0
  end

  def update joystick, dt
    if joystick
      nominal_speed = joystick.axes.norm * MAX_SPEED / Joystick::MAX_AXIS
      nominal_direction = joystick.axes.angle
      nominal_turret_direction = joystick.turret_axes.angle - @direction
    else
      nominal_speed = 0
      nominal_direction = 0
      nominal_turret_direction = 0
    end
    speed_change = (nominal_speed - @speed).limit ACCELERATION * dt
    direction_change = (nominal_direction - @direction).limit_angle TURN_RATE * dt
    turret_direction_change = (nominal_turret_direction - @turret_direction).limit_angle TURRET_TURN_RATE * dt
    @direction = (@direction + direction_change) % (2 * Math::PI)
    @turret_direction = (@turret_direction + turret_direction_change) % (2 * Math::PI)
    @speed += speed_change
    @position += speed * dt
  end

  def speed
    Matrix.rotation(@direction) * Vector[@speed, 0]
  end

  def turret_position
    @position + Matrix.rotation(@direction) * Vector[-20, -20]
  end

  def nozzle_position
    turret_position + Matrix.rotation(turret_direction) * Vector[32, 0]
  end

  def turret_direction
    @direction + @turret_direction
  end
end
