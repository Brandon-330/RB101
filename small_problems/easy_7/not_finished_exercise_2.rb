def letter_case_count(s)
  case_count_hash = Hash.new(0)
  s.each_char do |char|
    case_count_hash[:lowercase] += 1 if char.downcase
    case_count_hash[:uppercase] += 1 if char.upcase
    case_count_hash[:neither] += 1 if !char.upcase && !char.downcase
  end
  p case_count_hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }