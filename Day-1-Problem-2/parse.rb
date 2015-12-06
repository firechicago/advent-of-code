brackets = File.read(ARGV[0])

floor = 0

brackets.each_char.with_index(1) do |bracket, i|
  floor += 1 if bracket == '('
  floor -= 1 if bracket == ')'
  if floor < 0
    puts i
    break
  end
end
