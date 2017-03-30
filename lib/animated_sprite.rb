class AnimatedSprite < OrientedSprite
  def index physics
    (physics.relative_age * @sprites.size).floor
  end
end
