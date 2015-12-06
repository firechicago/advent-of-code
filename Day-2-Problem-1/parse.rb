raw_data = File.readlines(ARGV[0])

gifts = raw_data.map do |string|
  string.split('x').map(&:to_i)
end

total_paper = gifts.reduce(0) do |paper, gift|
  sides = [gift[0] * gift[1], gift[1] * gift[2], gift[0] * gift[2]]
  paper += sides.reduce(0, &:+) * 2 + sides.min
end

puts total_paper
