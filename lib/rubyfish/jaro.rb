module RubyFish::Jaro
  include ::RubyFish::JaroWinkler
  extend ::RubyFish::JaroWinkler

  def distance a, b
    _distance(a, b, :winklerize => false)
  end

  module_function :distance

end