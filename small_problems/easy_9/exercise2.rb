def twice(n)
  string_n = n.to_s
  string_n_size = string_n.size
  if string_n_size.even? && string_n[0, string_n_size/2 ] == string_n[string_n_size/2, string_n_size/2]
    n
  else
    n * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10