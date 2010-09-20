module RubyFish::JaroWinkler

  def _distance a, b, opts = {}
    long_tolerance = opts[:long_tolerance]
    winklerize = opts[:winklerize]

    as = a.to_s
    bs = b.to_s

    as_length = as.size
    bs_length = bs.size

    if as_length == 0 && bs_length == 0
      return 1
    end

    if as_length == 0 || bs_length == 0
      return 0
    end

    if as_length > bs_length
      search_range = as_length
      min_len = bs_length
    else
      search_range = bs_length
      min_len = as_length
    end

    as_flag = Array.new(as_length + 1, false)
    bs_flag = Array.new(bs_length + 1, false)

    search_range = (search_range / 2) - 1
    search_range = 0 if search_range < 0

    # Looking only within the search range, count and flag the matched pairs.
    common_chars = 0
    (0...as_length).each do |i|
      low_lim = (i >= search_range) ? i - search_range : 0
      hi_lim = (i + search_range <= bs_length - 1) ? (i + search_range) : bs_length - 1
      (low_lim..hi_lim).each do |j|
         if !bs_flag[j] && bs[j] == as[i]
            as_flag[i] = bs_flag[j] = true
            common_chars += 1
            break
         end
      end
    end

    # If no characters in common - return
    return 0 if common_chars == 0

    # Count the number of transpositions
    k = trans_count = 0
    (0...as_length).each do |i|
       if as_flag[i]
         for j in (k...bs_length) do
           if bs_flag[j]
              k = j + 1
              break
           end
         end
         trans_count += 1 if as[i] != bs[j]
       end
    end

    trans_count = trans_count / 2

    # adjust for similarities in nonmatched characters

    one_third = 1.0/3
    # Main weight computation.
    weight = ( one_third * common_chars / as_length +
               one_third * common_chars / bs_length +
               one_third * (common_chars - trans_count) / common_chars )

#    # Continue to boost the weight if the strings are similar
    if winklerize && weight > 0.7
      # Adjust for having up to the first 4 characters in common
      j = (min_len >= 4) ? 4 : min_len
      i = 0
      while ((i<j)&&(as[i]==bs[i])&&((as[i].ord > 57) || (as[i].ord < 48)))
        i+=1
      end

      weight += i * 0.1 * (1.0 - weight) if i > 0

      # Optionally adjust for long strings.
      #   After agreeing beginning chars, at least two more must agree and
      #     the agreeing characters must be > .5 of remaining characters.
      if long_tolerance && (min_len>4) && (common_chars > i+1) && (2 * common_chars >= min_len + i)
        if as[0].ord > 57 || as[0].ord < 48
            weight += (1.0 - weight) * (common_chars - i - 1) / (as_length + bs_length - i * 2 + 2).to_f
        end
      end
    end

    weight
  end

  def distance a, b, opts = {}
    _distance(a, b, :winklerize => true)
  end

  module_function :distance
  module_function :_distance

end