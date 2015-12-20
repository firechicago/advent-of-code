input = ARGV[0]

ascending_triads = ('a'..'x').map do |letter|
  letter + letter.next + letter.next.next
end
@triads_regex = ascending_triads.join('|')

def valid_password(string)
  two_pairs = string.match(/([a-z])\1.*([a-z])\2/)
  has_iol = string.match(/[iol]/)
  has_triad = string.match(/(#{@triads_regex})/)

  two_pairs && !has_iol && has_triad
end

until valid_password(input)
  input = input.next
end

puts input
