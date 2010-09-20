module RubyFish::Hamming
  def distance a, b
    distance = 0
    as, bs = a.to_s, b.to_s

    short, long = [as, bs].sort

    long.chars.zip(short.chars).each {|ac, bc| distance += 1 if ac != bc }

    distance
  end

  module_function :distance
end