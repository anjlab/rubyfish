module RubyFish::Levenshtein

  # http://en.wikipedia.org/wiki/Levenshtein_distance
  def distance a, b
    as, bs = a.to_s, b.to_s

    as_length = as.size
    bs_length = bs.size

    rows = as_length + 1
    cols = bs_length + 1

    dist = ::RubyFish::MMatrix.new rows, cols
    (0...rows).each {|i| dist[i, 0] = i}
    (0...cols).each {|j| dist[0, j] = j}

    (1...cols).each do |j|
      (1...rows).each do |i|
        if as[i - 1] == bs[j - 1]
         dist[i, j] = dist[i - 1, j - 1]
        else
          d1 = dist[i - 1, j] + 1
          d2 = dist[i, j - 1] + 1
          d3 = dist[i - 1, j - 1] + 1

          dist[i, j] = [d1, d2, d3].min;
        end
      end
    end

    dist[as_length, bs_length];
  end

  module_function :distance

end