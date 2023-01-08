DEGREE = "\xC2\xB0"
MINUTES_IN_HOUR = 60
SECONDS_IN_MINUTE = 60

def dms(n)
  if n.to_s.include?('.')
    degrees, decimal = n.to_s.split('.')
    minutes = (("0." + decimal.to_s).to_f / 100) * MINUTES_IN_HOUR
    minutes, decimal = (minutes * 100).to_s.split('.')
    seconds = (("0." + decimal.to_s).to_f) * SECONDS_IN_MINUTE
    %(#{degrees}#{DEGREE}#{format('%02d', minutes)}'#{format('%02d', seconds)}")
  else
    %(#{n}#{DEGREE}00'00")
  end
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")