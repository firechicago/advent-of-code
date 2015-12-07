require 'digest'

def md5(index, input = 'iwrupvqb')
  Digest::MD5.hexdigest(input + index.to_s)
end

index = 0
hash = md5(index)
until hash[0..5] == "000000"
  index += 1
  hash = md5(index)
end
puts index
