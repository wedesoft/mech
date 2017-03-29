class Sprite
  def initialize renderer, file_name, count
    @sprite = (0...count).map { |i| renderer.create_texture_from SDL2::Surface.load file_name % i }
    @count = count
  end

  def index angle
    (angle * @count / (2 * Math::PI)).round % @count
  end

  def rectangle position
    x, y = *position
    w, h = @sprite.first.w, @sprite.first.h
    SDL2::Rect[x - w / 2, y - h / 2, w, h]
  end

  def paint renderer, position, direction
    sprite = @sprite[index(direction)]
    renderer.copy sprite, nil, rectangle(position)
  end
end

