#encoding: utf-8

require 'spec_helper'

describe RubyFish::Levenshtein do

  it "should calculate distance" do
    subject.should match_cases([
      ["jellyfish", "smellyfish", 2],
      ["sittings", "kitting", 2],
      ["sitting", "kitting", 1],
      ["sunday", "saturday", 3],
      ["one", "one", 0],
      ["привед", "привет", 1],
      ["", "", 0],
      ["abc", "", 3],
      ["bc", "abc", 1],
      ["kitten", "sitting", 3],
      ["Saturday", "Sunday", 3],
      ["abc", "acb", 2],
      ["abc", "bac", 2]
    ])
  end

  it "should work with nils" do
    subject.distance(nil, nil).should == 0
  end
end