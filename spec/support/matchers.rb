module RubyFish
  module Spec
    module Matchers
      ::RSpec::Matchers.define :match_cases do |cases|
        match do |actual|
          @_index = 0
          cases.each do |a, b, v|
            @_value = actual.distance(a, b)
            @_value.should == v
            @_index += 1
          end
        end

        failure_message_for_should do |actual|
          "expected that distance('#{cases[@_index][0]}', '#{cases[@_index][1]}') would be #{cases[@_index][2]} but got #{@_value}"
        end
      end

      ::RSpec::Matchers.define :close_to_cases do |cases|
        match do |actual|
          @_index = 0
          cases.each do |a, b, v|
            @_value = actual.distance(a, b)
            @_value.should be_close(v, 0.001)
            @_index += 1
          end
        end

        failure_message_for_should do |actual|
          "expected that distance('#{cases[@_index][0]}', '#{cases[@_index][1]}') would be close to #{cases[@_index][2]} but got #{@_value}"
        end
      end

    end
  end
end
