module RubyFish
  class MMatrix
    def initialize nrows, ncolumns
      @rows = Array.new(nrows) { Array.new(ncolumns) {0}}
    end

    def [](i, j)
      @rows[i][j]
    end

    def []=(i, j, v)
      @rows[i][j] = v
    end

    def each_index
      @rows.each_with_index do |r, i|
        r.each_index do |j|
          yield i, j
        end
      end
    end

    def each_with_index
      each_index do |i, j|
        yield self[i, j], i, j
      end
    end
  end
end