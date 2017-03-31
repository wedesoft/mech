def collision unit, target, radius
  distance = target.position - unit.position
  change = target.speed - unit.speed
  c = distance.sqr - radius ** 2
  if c < 0
    0
  else
    b = 2 * change.inner_product(distance)
    if b > 0
      nil
    else
      a = change.sqr
      if a > 0
        (-b - Math.sqrt(b ** 2 - 4 * a * c)) / (2 * a)
      else
        nil
      end
    end
  end
end
