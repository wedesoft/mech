require 'sdl2'
require 'audio'
require 'mech_graphics'
require 'mech'
require 'bullet'
require 'explosion'
require 'joystick'


class Game
  def initialize
    SDL2.init SDL2::INIT_VIDEO | SDL2::INIT_JOYSTICK | SDL2::INIT_AUDIO
    @window = SDL2::Window.create 'Mech', SDL2::Window::POS_UNDEFINED, SDL2::Window::POS_UNDEFINED, 640, 480, SDL2::Window::Flags::FULLSCREEN_DESKTOP
    w, h = *@window.size
    @audio = Audio.new
    @renderer = @window.create_renderer -1, 0
    @mech = Mech.new Vector[w/2, h/2]
    @units = [@mech]
    @graphics = {
      Mech      => MechGraphics.new(@renderer),
      Bullet    => Sprite.new(@renderer, 'data/bullet.png'),
      Explosion => Sprite.new(@renderer, 'data/explosion20.png')
    }
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
        @units << Bullet.new(@mech.nozzle_position, @mech.turret_direction)
      end
      @quit ||= @joystick.quit
    end
  end

  def paint
    @renderer.draw_color = [0xA0, 0xA0, 0xA0]
    @renderer.clear
    @units.each do |unit|
      @graphics[unit.class].paint @renderer, unit
    end
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
      @units = @units.collect do |unit|
        unit.update dt, @joystick
      end.inject :+
      time += dt
    end
  end
end
