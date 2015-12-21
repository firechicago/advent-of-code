raw_data = File.readlines(ARGV[0])
race_time = ARGV[1].to_i

class Reindeer
  attr_reader :run_time, :rest_time, :speed, :name

  def initialize(name, run_time, rest_time, speed)
    @name = name
    @run_time = run_time
    @rest_time = rest_time
    @speed = speed
  end

  def cycle_time
    @cycle_time ||= run_time + rest_time
  end

  def distance_traveled(travel_time)
    if travel_time % cycle_time == 0
      return run_time * speed * travel_time / cycle_time
    elsif travel_time % cycle_time > run_time
      return run_time * speed * ( travel_time / cycle_time + 1 )
    else
      remainder = speed * ( travel_time % cycle_time )
      return run_time * speed * travel_time / cycle_time + remainder
    end
  end
end

reindeer = []
raw_data.each do |string|
  name = string.match(/[A-Z][a-z]+/).to_s
  speed, run_time, rest_time = string.scan(/\d+/).map(&:to_i)
  reindeer << Reindeer.new(name, run_time, rest_time, speed)
end

puts reindeer.map { |r| r.distance_traveled(race_time) }.max
