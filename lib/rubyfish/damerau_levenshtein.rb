module RubyFish::DamerauLevenshtein

  # http://en.wikipedia.org/wiki/Levenshtein_distance
  # http://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance

  def _distance a, b, opts = {}
    allow_swaps = opts[:allow_swaps]
    ignore_case = opts[:ignore_case]
    
    as = a.to_s
    bs = b.to_s
    
    if ignore_case
    	as.downcase!
    	bs.downcase!
    end

    rows = as.size + 1
    cols = bs.size + 1

    dist = [
        Array.new(cols) {|k| k},
        Array.new(cols) {0},
        Array.new(cols) {0}
    ]
	
    (1...rows).each do |i|
      k = i % 3
      dist[k][0] = i

      (1...cols).each do |j|
        cost = as[i - 1] == bs[j - 1] ? 0 : 1

        #minimum of deletion, insertion, substitution
        d1 = dist[k - 1][j] + 1
        d2 = dist[k][j - 1] + 1
        d3 = dist[k - 1][j - 1] + cost

        d_now = [d1, d2, d3].min

        if allow_swaps && i > 1 && j > 1 && as[i - 1] == bs[j - 2] && as[i - 2] == bs[j - 1]
          d1 = dist[k - 2][j - 2] + cost
          d_now = [d_now, d1].min;
        end

        dist[k][j] = d_now;
      end
    end

    dist[(rows - 1) % 3][-1]
  end

  def distance a, b, opts = {}
    _distance(a, b, :allow_swaps => true, :ignore_case => opts[:ignore_case])
  end

  module_function :distance
  module_function :_distance
end