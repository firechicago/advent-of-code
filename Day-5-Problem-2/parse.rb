def nice?(string)
  string.match(/(..).*\1+/) && string.match(/(.).\1+/)
end

raw_data = File.readlines(ARGV[0])

nice_strings = raw_data.reduce(0) do |num_nice, string|
  num_nice += 1 if nice?(string)
  num_nice
end

puts nice_strings
