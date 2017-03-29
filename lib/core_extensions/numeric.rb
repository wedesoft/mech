class Numeric
  def limit abs_value
    if self > abs_value
      abs_value
    elsif self < -abs_value
      -abs_value
    else
      self
    end
  end

  def limit_angle abs_value
    angle = self % (2 * Math::PI)
    if angle <= abs_value or angle >= 2 * Math::PI - abs_value
      self
    else
      if angle <= Math::PI
        abs_value
      else
        -abs_value
      end
    end
  end
end

