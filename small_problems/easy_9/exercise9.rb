words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
'flow', 'neon']

def anagrams(words)
  # Create an all anagrams array which will be all unique anagrams in list
  all_anagrams = []

  words.each do |word_of_interest|
    # return an array of anagrams including the word itself
    anagrams = words.select do |words_thru_arr|
      words_thru_arr.chars.sort == word_of_interest.chars.sort
    end

    # If the array has more than 1 anagram, it includes itself AND other words
    all_anagrams << anagrams if anagrams.size > 1
  end

  # uniq! all anagrams and .each to print
  all_anagrams.uniq!.each { |anagrams| p anagrams }
  all_anagrams
end

anagrams(words)

