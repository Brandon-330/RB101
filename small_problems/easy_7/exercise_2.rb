def letter_case_count(s)
  case_count_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  
  s.each_char do |char|
    case char
    when /[a-z]/
      case_count_hash[:lowercase] += 1
    when /[A-Z]/
      case_count_hash[:uppercase] += 1
    else 
      case_count_hash[:neither] += 1
    end
  end

  case_count_hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }