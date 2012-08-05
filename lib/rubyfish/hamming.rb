module RubyFish::Hamming
  def distance a, b, opts={}
    ignore_case = opts[:ignore_case]
    distance = 0
    as, bs = a.to_s, b.to_s
    
    if ignore_case
    	as.downcase!
    	bs.downcase!
    end

    short, long = [as, bs].sort

    long.chars.zip(short.chars).each {|ac, bc| distance += 1 if ac != bc }

    distance
  end

  module_function :distance
end