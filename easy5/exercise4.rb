def swap(s)
  first_last_swap = []
  s = s.split(' ')
  s.each do |word| 
    word.each_char do |char|
      if char == word[-1]
        first_last_swap << word[0]
        first_last_swap << ' '
      elsif char == word[0]
        first_last_swap << word[-1]
      else
        first_last_swap << char
      end
    end
  end
  first_last_swap.join.strip
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
p swap('construction')