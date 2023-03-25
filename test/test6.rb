=begin
17 27
### Problem
# Input: String
# Output: String

## Question
- Can I mutate original object? 
- Always contain more than 3 words?
- Always have more than 2 characters?

## Rules
# Explicit:
- Every 3rd word has every 2nd character upcased

### Data Structure
# word_counter = 0
# #split(' ') original array and #map
  - word_counter += 1
  - if word_counter == 3
      ind = 0
      #chars #map do 
        ind += 1
        if ind.even?
          char.upcase
        else
          char
        end
      end.join('')
    else
      word
    end
  end.join(' ')
=end

def to_weird_case(string)
  word_counter = 0
  string.split(' ').map do |word|
    word_counter += 1
    if word_counter % 3 == 0
      ind = 0
      word.chars.map do |char|
        ind += 1
        if ind.even?
          char.upcase
        else
          char
        end
      end.join('')
    else
      word
    end
  end.join(' ')
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'