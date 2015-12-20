raw_data = File.readlines(ARGV[0])

def action(string)
  string.match(/[A-Z]+/).to_s
end

def receiver(string)
  string.chomp.match(/[a-z]+\z/).to_s
end

def arguments(string)
  string.scan(/(\d+|[a-z]+)(?= )/).flatten
end

class Wire
  @@diagram = {}
  attr_reader :name, :action, :arguments

  def initialize(name, action, arguments)
    @action = action
    @arguments = arguments
    @name = name
    @@diagram[name] = self
  end

  def self.diagram
    @@diagram
  end

  def value
    return @value if @value

    evaluated_arguments = arguments.map do |arg|
      integer?(arg) ? arg.to_i : Wire.diagram[arg].value
    end

    @value ||= case action
    when ""
      evaluated_arguments.first
    when "AND"
      evaluated_arguments.reduce(&:&)
    when "OR"
      evaluated_arguments.reduce(&:|)
    when "NOT"
      65535 - evaluated_arguments.first
    when "LSHIFT"
      evaluated_arguments.first << evaluated_arguments.last
    when "RSHIFT"
      evaluated_arguments.first >> evaluated_arguments.last
    end
  end

  private

  def integer?(string)
    string.to_i.to_s == string
  end
end


wires = []
raw_data.each do |string|
  wires << Wire.new(receiver(string), action(string), arguments(string))
end

puts Wire.diagram['a'].value
