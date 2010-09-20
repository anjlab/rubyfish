#encoding: utf-8

require 'spec_helper'

describe RubyFish::DamerauLevenshtein do

  it "should calculate distance" do
    subject.should match_cases([
      ["jellyfish", "smellyfish", 2],
      ["sittings", "kitting", 2],
      ["sunday", "saturday", 3],
      ["one", "one", 0],
      ["привед", "привет", 1],
      ["", "", 0],
      ["abc", "", 3],
      ["bc", "abc", 1],
      ["abc", "acb", 1]
    ])
  end

  it "should work with nils" do
    subject.distance(nil, nil).should == 0
  end
end