def staggered_case(s)
  new_s = ''
  s.each_char.with_index do |char, ind| 
    if !!char.match(/[a-zA-Z]/) && ind.odd?
      new_s << char.swapcase
    else
      new_s << char
    end
  end
  p new_s
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'