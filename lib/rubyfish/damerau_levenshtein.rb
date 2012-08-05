module RubyFish::DamerauLevenshtein

  # http://en.wikipedia.org/wiki/Levenshtein_distance
  # http://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance

  def _distance a, b, opts = {}
    allowswaps = opts[:allowswaps]
    
    as = a.to_s
    bs = b.to_s

    rows = as.size + 1
    cols = bs.size + 1

	curr = Array.new(cols) {|k| k}
	prev = []

    (1...rows).each do |i|
      allowswaps ? tert = prev : ""
      prev = curr
      curr = Array.new(cols) {|k| k == 0 ? i : 0}
      
      (1...cols).each do |j|
        cost = as[i - 1] == bs[j - 1] ? 0 : 1

        #minimum of deletion, insertion, substitution
        d1 = prev[j] + 1
        d2 = curr[j - 1] + 1
        d3 = prev[j - 1] + cost

        d_now = [d1, d2, d3].min

        if allowswaps && i > 2 && j > 2 && as[i - 1] == bs[j - 2] && as[i - 2] == bs[j - 1]
          d1 = tert[j - 2] + cost
          d_now = [d_now, d1].min;
        end

        curr[j] = d_now;
      end
    end

    curr[-1]
  end

  def distance a, b, opts = {}
    _distance(a, b, :allowswaps => true)
  end

  module_function :distance
  module_function :_distance
end