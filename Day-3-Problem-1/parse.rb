raw_data = File.read(ARGV[0])

class Santa
  attr_accessor :santas_location

  def initialize(coordinates = [0,0])
    @santas_location = coordinates
  end

  def self.gifts_given
    @@gifts_given ||= Hash.new(0)
  end

  def give_gift
    Santa.gifts_given[santas_location.to_s] += 1
  end

  def move(direction)
    case direction
    when "<"
      santas_location[1] -= 1
    when ">"
      santas_location[1] += 1
    when "^"
      santas_location[0] += 1
    when "v"
      santas_location[0] -= 1
    else
      fail ArgumentError
    end
    give_gift
  end
end

santa = Santa.new
santa.give_gift

raw_data.each_char do |direction|
  santa.move(direction)
end

puts Santa.gifts_given.keys.length

