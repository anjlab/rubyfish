module RubyFish::LongestSubstring

  # http://en.wikibooks.org/wiki/Algorithm_implementation/Strings/Longest_common_substring#Ruby
  def distance a, b
    as = a.to_s
    bs = b.to_s

    rows = as.size
    cols = bs.size

    if rows == 0 || cols == 0
      return 0
    end

    num= ::RubyFish::MMatrix.new rows, cols
    len,ans=0

    as.each_char.with_index do |ac, i|
      bs.each_char.with_index do |bc, j|
        unless ac == bc
          num[i, j]=0
        else
          (i==0 || j==0)? num[i, j] = 1 : num[i, j] = 1 + num[i-1, j-1]
          len = ans = num[i, j] if num[i, j] > len
        end
      end
    end

    ans
  end

  def longest_substring a, b
    as = a.to_s
    bs = b.to_s

    rows = as.size
    cols = bs.size

    res = ""
    len = 0
    last_sub = 0

    if rows == 0 || cols == 0
      return res
    end

    num = ::RubyFish::MMatrix.new rows, cols

    as.each_char.with_index do |ac, i|
      bs.each_char.with_index do |bc, j|
        unless ac == bc
          num[i, j] = 0
        else
          (i == 0 || j == 0)? num[i, j] = 1 : num[i, j] = 1 + num[i-1, j-1]
          if num[i, j] > len
            len = num[i, j]
            this_sub = i
            this_sub -= num[i-1, j-1] unless num[i-1, j-1].nil?
            if last_sub == this_sub
              res += as[i,1]
            else
              last_sub = this_sub
              res = as[last_sub, (i+1) - last_sub]
            end
          end
        end
      end
    end

    res
  end

  def longest_substring_index(a, b)
    a.index(longest_substring(a, b))
  end

  module_function :distance
  module_function :longest_substring
  module_function :longest_substring_index

end