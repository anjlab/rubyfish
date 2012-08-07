module RubyFish::LongestSubsequence

  # http://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Longest_common_subsequence#Ruby
  def distance a, b, opts={}
    ignore_case = opts[:ignore_case]
    
    as = a.to_s
    bs = b.to_s

    if ignore_case
    	as.downcase!
    	bs.downcase!
    end
    
    rows = as.size
    cols = bs.size

    if rows == 0 || cols == 0
      return 0
    end

    num = ::RubyFish::MMatrix.new  rows + 1, cols + 1

    (1..rows).each do |i|
      (1..cols).each do |j|
        if as[i - 1] == bs[j - 1]
          num[i, j] = num[i - 1, j - 1] + 1;
        else
          if num[i, j - 1] > num[i - 1, j]
            num[i, j] = num[i, j - 1]
          else
            num[i, j] = num[i - 1, j]
          end
        end
      end
    end
    num[rows, cols]
  end

  module_function :distance
end