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

  module_function :distance

end