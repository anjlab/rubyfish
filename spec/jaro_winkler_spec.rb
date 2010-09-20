#encoding: utf-8

require 'spec_helper'

describe RubyFish::JaroWinkler do

  it "should calculate distance" do

    subject.should close_to_cases([
      ["dixon", "dicksonx", 0.8133],
      ["dixon", "dicksonx", 0.8133],
      ["martha", "marhta", 0.9611],
      ["dwayne", "duane", 0.84]
    ])

  end

  it "should work with nils"  do
    subject.distance(nil, nil).should == 1
  end

end