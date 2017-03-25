#!/usr/bin/env ruby
require 'sdl2'


SDL2.init SDL2::INIT_VIDEO | SDL2::INIT_JOYSTICK

window = SDL2::Window.create 'Mech', 0, 0, 640, 480, SDL2::Window::Flags::FULLSCREEN_DESKTOP
renderer = window.create_renderer -1, 0
joystick = nil
red   = 0xA0
green = 0xA0
blue  = 0xA0

loop do
  while event = SDL2::Event.poll
    case event
    when SDL2::Event::Quit
      exit
    when SDL2::Event::JoyDeviceAdded
      joystick = SDL2::Joystick.open event.which
    when SDL2::Event::JoyAxisMotion
      red   = (event.value + 32768) * 255 / 65536 if event.axis == 0
      green = (event.value + 32768) * 255 / 65536 if event.axis == 1
      blue  = (event.value + 32768) * 255 / 65536 if event.axis == 3
    end

    renderer.draw_color = [red, green, blue]
    renderer.clear
    renderer.present
  end
end
