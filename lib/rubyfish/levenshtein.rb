module RubyFish::Levenshtein

  include ::RubyFish::DamerauLevenshtein
  extend ::RubyFish::DamerauLevenshtein

  def distance a, b
    _distance(a, b, :allowswaps => false)
  end

  module_function :distance


end