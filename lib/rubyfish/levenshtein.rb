module RubyFish::Levenshtein

  include ::RubyFish::DamerauLevenshtein
  extend ::RubyFish::DamerauLevenshtein

  def distance a, b, opts={}
    _distance(a, b, :allowswaps => false, :ignore_case => opts[:ignore_case])
  end

  module_function :distance


end