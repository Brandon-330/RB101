def balanced?(s)
  if s.include?('(') || s.include?(')')
    starting_parantheses = s.count('(')
    closing_parantheses = s.count(')')

    if starting_parantheses != closing_parantheses
      return false
    elsif s.start_with?(')') || s.end_with?('(')
      return false
    else
      true
    end

  else
    true
  end
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false