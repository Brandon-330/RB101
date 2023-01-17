SPELLING_BLOCKS = [
  { 'B' => 'O', used?: 'false' },
  { 'X' => 'K', used?: 'false' },
  { 'D' => 'Q', used?: 'false' },
  { 'C' => 'P', used?: 'false' },
  { 'N' => 'A', used?: 'false' },
  { 'G' => 'T', used?: 'false' },
  { 'R' => 'E', used?: 'false' },
  { 'F' => 'S', used?: 'false' },
  { 'J' => 'W', used?: 'false' },
  { 'H' => 'U', used?: 'false' },
  { 'V' => 'I', used?: 'false' },
  { 'L' => 'Y', used?: 'false' },
  { 'Z' => 'M', used?: 'false' } 
]

def block_word?(s)
  s.upcase.each_char do |char|
    SPELLING_BLOCKS.each do |hash|
      bool = hash.all? do |k, v|
        if k.to_s.include?(char) || v.to_s.include?(char)
          hash[:used?] == false ? hash[:used?] = true : hash[:used?] = false
          hash[:used?]
        end
      end
      p bool
    end
  end
end

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true