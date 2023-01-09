def between_10_100?(n)
  (10..100).cover?(n)
end

p between_10_100?(42)