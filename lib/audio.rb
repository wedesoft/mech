require 'sdl2'


class Audio
  def initialize
    SDL2::Mixer.init SDL2::Mixer::INIT_OGG
    SDL2::Mixer.open 22050, SDL2::Mixer::DEFAULT_FORMAT, 2, 512
  end

  def self.load file_name
    SDL2::Mixer::Chunk.load file_name
  end

  def play sound
    SDL2::Mixer::Channels.play 0, sound, 0
  end
end
