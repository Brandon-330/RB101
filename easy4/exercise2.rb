def century(n)
  century = n.to_i / 100
  century += 1 if (n % 100) > 0
  century = century.to_s
  if (century.to_i % 100) < 20 && (century.to_i % 100) > 10
    century << 'th'
  else
    case century[-1]
    when '1'
      century << 'st'
    when '2'
      century << 'nd'
    when '3'
      century << 'rd'
    else
      century << 'th'
    end
  end
end

p century(2000)
p century(2001)
p century(1965)
p century(256)
p century(5)
p century(10103)
p century(1052)
p century(1127)
p century(11201)