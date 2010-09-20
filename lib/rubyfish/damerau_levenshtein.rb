require 'matrix'

module RubyFish::DamerauLevenshtein

  def distance a, b
    as = a.to_s
    bs = b.to_s

    rows = as.size + 1
    cols = bs.size + 1

    dist = ::RubyFish::MMatrix.new(rows, cols)

    (0...rows).each {|i| dist[i, 0] = i}
    (0...cols).each {|j| dist[0, j] = j}

    (1...rows).each do |i|
      (1...cols).each do |j|
        cost = as[i - 1] == bs[j - 1] ? 0 : 1

        #minimum of deletion, insertion, substitution
        d1 = dist[i - 1, j] + 1
        d2 = dist[i, j - 1] + 1
        d3 = dist[i - 1, j - 1] + cost

        d_now = [d1, d2, d3].min

        if i > 2 && j > 2 && as[i - 1] == bs[j - 2] && as[i - 2] == bs[j - 1]
          d1 = dist[i - 2, j - 2] + cost
          d_now = [d_now, d1].min;
        end

        dist[i, j] = d_now;
      end
    end

    dist[as.size, bs.size]
  end

  module_function :distance
end