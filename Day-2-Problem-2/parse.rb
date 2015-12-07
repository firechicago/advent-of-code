raw_data = File.readlines(ARGV[0])

gifts = raw_data.map do |string|
  string.split('x').map(&:to_i)
end

total_ribbon = gifts.reduce(0) do |ribbon, gift|
  sides = gift.reject { |side| side == gift.max }
  until sides.length > 1
    sides << gift.max
  end
  ribbon += sides.reduce(0, &:+) * 2 + gift.reduce(1, &:*)
end

puts total_ribbon
