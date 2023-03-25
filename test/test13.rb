=begin
53 03
### Problem
# Input: String
# Output: String 

## Rules
# Explicit:
- Every 2nd character in every 3 words are converted to upcase

# Implicit:
- Can mutate original string

### Data Structure
# ind1 = -1
# #split #map do |word|
  - ind1 += 1
  - if word == 3
      - ind2 = -1
      - #word.chars.map do |char|
        ind2 += 1
        - if ind2.odd?
            char.upcase
          else
            char.downcase
          end
        end.join('')
=end

def to_weird_case(str)
  ind1 = 0
  str.split(' ').map do |word|
    ind1 += 1
    if ind1 % 3 == 0
      ind2 = 0
      word.chars.map do |char|
        ind2 += 1
        if ind2.even?
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

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'