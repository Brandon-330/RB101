def swap_name(s)
  arr = s.split
  "#{arr[1]}, #{arr[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'