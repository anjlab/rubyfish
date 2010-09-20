#encoding: utf-8

require 'spec_helper'

describe RubyFish::LongestSubstring do

  it "should calculate distance" do
    subject.should match_cases([
      ["jellyfish", "smellyfish", 8],
      ["sittings", "kitting", 6],
      ["sitting", "kitting", 6],
      ["sunday", "saturday", 3],
      ["one", "one", 3],
      ["привед", "привет", 5],
      ["", "", 0],
      ["abc", "", 0],
      ["bc", "abc", 2]
    ])
  end

  it "should work with nils" do
    subject.distance(nil, nil).should == 0
  end
end