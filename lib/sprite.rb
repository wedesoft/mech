class Sprite
  def initialize renderer, file_name
    @sprite = renderer.create_texture_from SDL2::Surface.load file_name
  end

  def index angle
    (angle * @count / (2 * Math::PI)).round % @count
  end

  def rectangle position
    x, y = *position
    w, h = @sprite.w, @sprite.h
    SDL2::Rect[x - w / 2, y - h / 2, w, h]
  end

  def paint renderer, physics
    renderer.copy @sprite, nil, rectangle(physics.position)
  end
end
