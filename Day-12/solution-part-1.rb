input = File.read(ARGV[0])

puts input.scan(/-?\d+/).map(&:to_i).reduce(&:+)
