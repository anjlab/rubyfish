module RubyFish::Jaro
  include ::RubyFish::JaroWinkler
  extend ::RubyFish::JaroWinkler

  def distance a, b, opts={}
    _distance(a, b, :winklerize => false, :ignore_case => opts[:ignore_case])
  end

  module_function :distance

end