require 'json'
input = File.read(ARGV[0])

data = JSON.parse(input)

@total = 0

def traverse(object)
  if object.class == Fixnum
    @total += object.to_i
  elsif object.class == Array
    object.each { |el| traverse(el) }
  elsif object.class == Hash
    object.values.each { |el| traverse(el) } unless object.values.detect { |el| el == "red" }
  end
end

traverse(data)
puts @total
