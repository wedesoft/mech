#!/usr/bin/env ruby
require 'matrix'
require 'sdl2'


class Sprite
  def initialize renderer, file_name
    @sprite = renderer.create_texture_from SDL2::Surface.load file_name
  end

  def paint renderer, position
    x, y = *position
    w, h = @sprite.w, @sprite.h
    renderer.copy @sprite, nil, SDL2::Rect[x - w / 2, y - h / 2, w, h]
  end
end

class Physics
  attr_reader :position
  attr_reader :speed

  def initialize
    @position = Vector[320, 240]
    @speed = Vector[0, 0]
  end

  def speed_x= value
    @speed = Vector[value, @speed[1]]
  end

  def speed_y= value
    @speed = Vector[@speed[0], value]
  end

  def update dt
    @position += Vector[*@speed] * dt
  end
end


class MechGame
  def initialize
    SDL2.init SDL2::INIT_VIDEO | SDL2::INIT_JOYSTICK | SDL2::INIT_AUDIO
    SDL2::Mixer.init SDL2::Mixer::INIT_OGG
    SDL2::Mixer.open 22050, SDL2::Mixer::DEFAULT_FORMAT, 2, 512
    @window = SDL2::Window.create 'Mech', 0, 0, 640, 480, 0 # SDL2::Window::Flags::FULLSCREEN_DESKTOP
    @renderer = @window.create_renderer -1, 0
    @mech_sprite = Sprite.new @renderer, 'mech.png'
    @mech_physics = Physics.new
    @laser_sound = SDL2::Mixer::Chunk.load 'laser.ogg'
    @joystick = nil
    @quit = false
  end

  def handle_events
    while event = SDL2::Event.poll
      case event
      when SDL2::Event::Quit
        @quit = true
      when SDL2::Event::JoyDeviceAdded
        @joystick = SDL2::Joystick.open event.which
      when SDL2::Event::JoyAxisMotion
        @mech_physics.speed_x = event.value * 100.0 / 32768 if event.axis == 0
        @mech_physics.speed_y = event.value * 100.0 / 32768 if event.axis == 1
      when SDL2::Event::JoyButtonDown
        SDL2::Mixer::Channels.play 0, @laser_sound, 0 if event.button == 3
      end
    end
  end

  def paint
    @renderer.draw_color = [0xA0, 0xA0, 0xA0]
    @renderer.clear
    @mech_sprite.paint @renderer, @mech_physics.position
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
      @mech_physics.update dt
      time += dt
    end
  end
end


MechGame.new.run
