# input: string
# output: substrings in an array fashion which are palindromes
# rules:
  # case sensitive
  # if none string, return empty array
  # if no palindrome, return empty array
  # return palindrome as is, without additional modifications
  # returned palindrome includes substrings
# algorith:
  # - create an empty array called `result` that will contain all required substrings
  # - create a `starting_index` variable (value `0`) for the starting index of a substring
  # - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
  #   - create a `num_chars` variable (value `2`) for the length of a substring
  #   - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
  #     - extract a substring of length `num_chars` from `string` starting at `starting_index`
  #     - append the extracted substring to the `result` array
  #     - increment the `num_chars` variable by `1`
  #   - end the inner loop
  #   - increment the `starting_index` variable by `1`
  # - end the outer loop
  # - return the `result` array
