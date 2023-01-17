def letter_percentages(s)
  count_hash = Hash.new(0.0)
  s.each_char do |char|
    if char =~ /[A-Z]/
      count_hash[:uppercase] += 1
    elsif char =~ /[a-z]/
      count_hash[:lowercase] += 1
    else
      count_hash[:neither] += 1
    end
  end
  
  percentage_hash = Hash.new(0.0)

  percentage_hash[:lowercase] = (count_hash[:lowercase]/s.size) * 100
  percentage_hash[:uppercase] = (count_hash[:uppercase]/s.size) * 100
  percentage_hash[:neither] = (count_hash[:neither]/s.size) * 100

  percentage_hash
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }