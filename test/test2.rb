=begin
  Input: string (lowercased)
  Output: string

  Explicit rules:

  Implicit rules:

  Notes:
  Anything after the character, should return after each letter upcased

=end

letter_hash = Hash.new(0)


('A'..'Z').each_with_index do |letter, ind|
  letter_hash[letter] = ind
end

def insert_missing_letters(string)
  string_arr = string.chars

  letter_hash = {}
  ('A'..'Z').each_with_index do |letter, ind|
    letter_hash[letter] = ind
  end

  arr = Array('A'..'Z')
  return_string = string_arr.each_with_object([]) do |char, obj|
    char_ind = letter_hash[char.upcase]
    obj << char
    
    arr.each_with_index do |letter, arr_ind|
      if arr_ind > char_ind && !string.chars.include?(letter.downcase)
        obj << letter
      end
    end
  end.join
  return_string
end


# You have to create a method that takes in a string
# and outputs the same string processed in a particular way.
#
# The method should insert ONLY after the first occurence of each character of the input string
# all the alphabet letters that:
#
# -are NOT in the original string
# -come after the letter of the string you are processing
#
# Each added letter should be in uppercase,
# the letters of the original string will always be in lowercase.
#
# Example:
#
# input: "holly"
#
# missing letters: "a,b,c,d,e,f,g,i,j,k,m,n,p,q,r,s,t,u,v,w,x,z"
#
# output: "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
#
# You don't need to validate input,
# the input string will always contain a certain amount of lowercase letters
# (min 1 / max 50).

=begin
I: string (lowercase)
O: string (altered version of input w/ both lowercase and uppercase)

Notes:
- requirements:
  - after each letter of input string, insert upcased letters that are not used in the input String
  - inserted letters after particular letter are those after the letter (alphabetically)
  - only do for first occurrence of a particular letter (meaning, if there are multiples of same letter in input string, only insert after the first occurrence)

D/A:
- init `soln` to string
- find the letters that are not being used in input string, save to `letters_not_used`
- look at each individual letter of the input string
    - if current letter is its first occurrence in input string, carry on....
      - iterate through individual letters of input String
      - at each iteration...
      - push current letter to `soln`
      - push all the upcased version of letters after current letter all the way to 'z' to `soln` except for the letters that are in `letters_not_used`.
    - otherwise NEXT
- return `soln`
=end

p insert_missing_letters("holly") == "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
p insert_missing_letters("hello") == "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
p insert_missing_letters("fred") == "fGHIJKLMNOPQSTUVWXYZrSTUVWXYZeGHIJKLMNOPQSTUVWXYZdGHIJKLMNOPQSTUVWXYZ"
p insert_missing_letters("z") == "z"
p insert_missing_letters("efgh") == "eIJKLMNOPQRSTUVWXYZfIJKLMNOPQRSTUVWXYZgIJKLMNOPQRSTUVWXYZhIJKLMNOPQRSTUVWXYZ"