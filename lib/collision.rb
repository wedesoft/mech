def collision a, b, radius
  if (b.position - a.position).norm <= radius
    0
  else
    nil
  end
end
