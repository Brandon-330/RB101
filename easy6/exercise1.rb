DEGREE = '\xC2\xB0'
MINUTES_IN_HOUR = 60
SECONDS_IN_MINUTE = 60

def dms(n)
  if n.to_s.include?('.')
    degrees, decimal = n.to_s.split('.')
    minutes = (decimal.to_f / 100) * MINUTES_IN_HOUR
    minutes, decimal = minutes.to_s.split('.')
    seconds = (seconds.to_f / 100) * SECONDS_IN_MINUTE
    %Q(%(#{degrees}#{DEGREE.force_encoding('utf-8')}#{format('%02d', minutes)}'#{format('%02d', seconds)}"))
  else
    %Q(%(#{n}#{DEGREE.encode(Encoding::UTF8)}00'00"))
  end
end

p dms(30) #== %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")