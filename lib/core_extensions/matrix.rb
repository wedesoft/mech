require 'matrix'


class Vector
  def angle
    Math.atan2 self[1], self[0]
  end

  def sqr
    inner_product self
  end
end

class Matrix
  def self.rotation angle
    c, s = Math.cos(angle), Math.sin(angle)
    Matrix[[c, -s], [s, c]]
  end
end
