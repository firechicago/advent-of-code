input = "1113222113"

def look_and_say(string)
  new_string = ""
  groups = string.scan(/(\d)(\1*)/).map { |a| a.reduce(&:+) }
  groups.each do |group|
    new_string << group.length.to_s
    new_string << group[0]
  end
  new_string
end

50.times do
  input = look_and_say(input)
end
puts input.length
