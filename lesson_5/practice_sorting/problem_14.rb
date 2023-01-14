hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.values.each_with_object([]) do |v, arr|
  if v[:type] == 'fruit'
    arr << v[:colors].map { |el| el.capitalize }
  elsif v[:type] == 'vegetable'
    arr << v[:size].upcase
  end
end