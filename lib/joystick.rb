require 'sdl2'


class Joystick
  MAX_AXIS = 32768

  attr_reader :quit

  def initialize event
    @device = SDL2::Joystick.open event.which
    @axes = [0, 0]
    @turret_axes = [0, 0]
    @button = false
    @quit = false
  end

  def handle_motion event
    @axes[0] = event.value if event.axis == 0
    @axes[1] = event.value if event.axis == 1
    @turret_axes[0] = event.value if event.axis == 3
    @turret_axes[1] = event.value if event.axis == 4
  end

  def handle_button event
    @button = true if event.button == 5
    @quit = true if event.button == 8
  end

  def axes
    Vector[*@axes]
  end

  def turret_axes
    Vector[*@turret_axes]
  end

  def button
    retval = @button
    @button = false
    retval
  end
end
