require 'sdl2'
require 'audio'
require 'mech_graphics'
require 'physics'
require 'bullet'
require 'joystick'


class Game
  def initialize
    SDL2.init SDL2::INIT_VIDEO | SDL2::INIT_JOYSTICK | SDL2::INIT_AUDIO
    @window = SDL2::Window.create 'Mech', SDL2::Window::POS_UNDEFINED, SDL2::Window::POS_UNDEFINED, 640, 480, SDL2::Window::Flags::FULLSCREEN_DESKTOP
    w, h = *@window.size
    @audio = Audio.new
    @renderer = @window.create_renderer -1, 0
    @mech_graphics = MechGraphics.new @renderer
    @mech_physics = Physics.new Vector[w/2, h/2]
    @bullet_physics = []
    @bullet_graphics = Sprite.new @renderer, 'data/bullet.png'
    @laser_sound = Audio.load 'data/laser.ogg'
    @quit = false
  end

  def handle_events
    while event = SDL2::Event.poll
      case event
      when SDL2::Event::Quit
        @quit = true
      when SDL2::Event::JoyDeviceAdded
        @joystick = Joystick.new event
      when SDL2::Event::JoyAxisMotion
        @joystick.handle_motion event
      when SDL2::Event::JoyButtonDown
        @joystick.handle_button event
      end
    end
    if @joystick
      if @joystick.button
        @audio.play @laser_sound
        @bullet_physics << Bullet.new(@mech_physics.nozzle_position, @mech_physics.turret_direction)
      end
      @quit ||= @joystick.quit
    end
  end

  def paint
    @renderer.draw_color = [0xA0, 0xA0, 0xA0]
    @renderer.clear
    @mech_graphics.paint @renderer, @mech_physics
    @bullet_physics.each do |physics|
      @bullet_graphics.paint @renderer, physics.position
    end
    @bullet_physics = @bullet_physics.select &:live?
    @renderer.present
  end

  def run
    time = Time.new.to_f
    while not @quit
      paint
      handle_events
      dt = Time.new.to_f - time
      if dt < 0.04
        sleep 0.04 - dt
        dt = 0.04
      end
      @mech_physics.update @joystick, dt
      @bullet_physics.each do |physics|
        physics.update dt
      end
      time += dt
    end
  end
end
