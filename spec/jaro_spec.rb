#encoding: utf-8

require 'spec_helper'

describe RubyFish::Jaro do

  it "should calculate distance" do
    subject.should close_to_cases([
      ["dixon", "dicksonx", 0.767],
      ["martha", "marhta", 0.944],
      ["dwayne", "duane", 0.822],
      ["jellyfish", "smellyfish", 0.896]
    ])
  end

  it "should work with nils"  do
    subject.distance(nil, nil).should == 1
  end

end