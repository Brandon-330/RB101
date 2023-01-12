def center_of(s)
  center = s.length/2
  s.length.odd? ? s[center] : s[center - 0.5] + s[center + 0.5]
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'