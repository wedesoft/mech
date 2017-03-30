require 'oriented_sprite'


class MechGraphics
  def initialize renderer
    @body_sprite = OrientedSprite.new renderer, 'data/mech%02d.png', 36
    @turret_sprite = OrientedSprite.new renderer, 'data/turret%02d.png', 36
  end

  def paint renderer, physics
    @body_sprite.paint renderer, physics
    @turret_sprite.paint renderer, physics.turret
  end
end

