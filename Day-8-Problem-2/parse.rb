raw_data = File.readlines(ARGV[0])
require 'pry'

result = 0
raw_data.each do |string|
  result += string.chomp.inspect.length
  result -= string.chomp.length
end

puts result
