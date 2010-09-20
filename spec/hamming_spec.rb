#encoding: utf-8

require 'spec_helper'

describe RubyFish::Hamming do

  it "should calculate distance" do
    subject.should match_cases([
      ["", "", 0],
      ["", "abc", 3],
      ["abc", "abc", 0],
      ["acc", "abc", 1],
      ["abcd", "abc", 1],
      ["abc", "abcd", 1],
      ["testing", "this is a test", 13],
      ["toned", "roses", 3],
      ["toned2", "roses", 4],
      ["toned2", "roses2", 3],
      ["1011101", "1001001", 2],
      ["2173896", "2233796", 3],
      ["привет", "привед", 1]
    ])
  end

  it "should work with nils"  do
    subject.distance(nil, nil).should == 0
  end

end