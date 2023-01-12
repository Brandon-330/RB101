def swapcase(s)
  s = s.chars.map do |char|
    case char
    when /[a-z]/
      char.upcase
    when /[A-Z]/
      char.downcase
    else
      char
    end
  end
  s.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'