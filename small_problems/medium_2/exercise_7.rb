require 'date'

def friday_13th(year)
  friday_13ths = 0
  months = Array(1..12)
  months.each do |month|
    if Date.new(year, month, 13, Date::GREGORIAN).friday?
      friday_13ths += 1
    end
  end
  friday_13ths
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2