=begin 4:51
### Problem
# Input: Integer
# Output: Print diamond

## Rules
# Explicit:
- n is an odd integer
- Print it based on an n x n grid

# Implicit:
- First line is blank

### Data structure
spaces start with (n - 1) / 2, and then counter it down
star counter + 2 every iteration until space counter <= 0
Afterwards, while loop until star counter < 1
4:59
=end

def diamond(n)
  puts ""
  space_counter = (n - 1) / 2
  star_counter = 1
  while space_counter > 0
    puts " " * space_counter + "*" * star_counter
    space_counter -= 1
    star_counter += 2
  end
  while star_counter >= 1
    puts " " * space_counter + "*" * star_counter
    space_counter += 1
    star_counter -= 2
  end
end

diamond(5)
