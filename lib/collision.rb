def collision unit, target, radius
  distance = target.position - unit.position
  change = target.speed - unit.speed

  c = distance.sqr - radius ** 2
  return 0 if c < 0 # already within specified radius

  b = 2 * change.inner_product(distance)
  return nil if b >= 0 # objects moving away from each other

  a = change.sqr
  determinant = b ** 2 - 4 * a * c
  return nil if determinant <= 0 # objects are going to pass each other

  # return first solution of quadratic equation
  (-b - Math.sqrt(determinant)) / (2 * a)
end
