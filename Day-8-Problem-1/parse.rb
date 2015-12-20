raw_data = File.readlines(ARGV[0])
require 'pry'

result = 0
raw_data.each do |string|
  result += string.chomp.length
  result -= eval(string).length
end

puts result
