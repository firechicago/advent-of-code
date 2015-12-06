brackets = File.read(ARGV[0])

floor = 0

brackets.each_char do |bracket|
  floor += 1 if bracket == '('
  floor -= 1 if bracket == ')'
end

puts floor
