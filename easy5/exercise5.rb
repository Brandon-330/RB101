def cleanup(s)
  s.gsub!(/\W+/, ' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '