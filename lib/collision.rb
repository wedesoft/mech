def collision a, b, radius
  if (b - a).norm <= radius
    0
  else
    nil
  end
end
