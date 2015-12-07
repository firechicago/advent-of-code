def nice?(string)
  has_double_letter = false
  has_naughty_string = false
  num_vowels = 0

  string.each_char.with_index do |char, i|
    num_vowels += 1 if %w(a e i o u).include?(char)
    has_double_letter = true if char == string[i + 1]
    has_naughty_string = true if %w(ab cd pq xy).include?(string[i..(i + 1)])
  end

  has_double_letter && !has_naughty_string && num_vowels >= 3
end

raw_data = File.readlines(ARGV[0])

nice_strings = raw_data.reduce(0) do |num_nice, string|
  num_nice += 1 if nice?(string)
  num_nice
end

puts nice_strings
