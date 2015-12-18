require 'pry'
raw_data = File.readlines(ARGV[0])

@lights = []
1000.times do
  @lights << [0] * 1000
end

def change(x1, y1, x2, y2, action)
  lights_to_change = (x1..x2).to_a.product((y1..y2).to_a)
  case action
  when "on"
    lights_to_change.each do |x,y|
      @lights[x][y] += 1
    end
  when "off"
    lights_to_change.each do |x,y|
      @lights[x][y] -= 1 unless @lights[x][y] <= 0
    end
  when "toggle"
    lights_to_change.each do |x,y|
      @lights[x][y] += 2
    end
  end
end

raw_data.each do |instruction|
  action = instruction.match(/(on|off|toggle)/).to_s
  coordinates = instruction.scan(/\d+/).map(&:to_i)
  change(*coordinates, action)
end

puts @lights.flatten.reduce(&:+)
