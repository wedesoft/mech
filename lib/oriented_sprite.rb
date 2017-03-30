require 'sprite'


class OrientedSprite
  def initialize renderer, file_name_format, count
    @sprites = (0...count).map { |i| Sprite.new renderer, file_name_format % i }
  end

  def index physics
    (physics.direction * @sprites.size / (2 * Math::PI)).round % @sprites.size
  end

  def paint renderer, physics
    @sprites[index(physics)].paint renderer, physics
  end
end
