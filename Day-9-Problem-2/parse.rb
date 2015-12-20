raw_data = File.readlines(ARGV[0])

def parse_line(string)
  locations = string.scan(/[A-Z][a-zA-Z]+/)
  distance = string.match(/\d+(?=\n)/).to_s.to_i
  { names: locations, distance: distance }
end

class Location
  attr_accessor :distances

  def initialize(name)
    @distances = {}
    @name = name
    Location.all[name] = self
  end

  def self.all
    @@all ||= {}
  end

  def self.find_or_create_by(name)
    all[name] || Location.new(name)
  end

  def self.add_distance(names: names, distance: distance)
    locations = names.map do |name|
     Location.find_or_create_by(name)
    end

    locations.first.distances[locations[1]] = distance
    locations[1].distances[locations.first] = distance
  end

  def self.calculate_route(locations)
    distance = 0
    locations.each_with_index do |location, i|
      unless i == locations.length - 1
        distance += location.distances[locations[i + 1]]
      end
    end
    distance
  end
end

raw_data.each do |string|
  Location.add_distance(parse_line(string))
end

distances = Location.all.values.permutation.to_a.map do |route|
  Location.calculate_route(route)
end

puts distances.max
