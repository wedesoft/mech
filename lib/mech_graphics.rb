require 'sprite'


class MechGraphics
  def initialize renderer
    @body_sprite = Sprite.new renderer, 'data/mech%02d.png', 36
    @turret_sprite = Sprite.new renderer, 'data/turret%02d.png', 36
  end

  def paint renderer, physics
    @body_sprite.paint renderer, physics.position, physics.direction
    @turret_sprite.paint renderer, physics.turret_position, physics.turret_direction
  end
end
