#encoding: utf-8

require 'spec_helper'

describe RubyFish::DoubleMetaphone do

  it "should calculate code" do
    subject.phonetic_code("privet").should == subject.phonetic_code("prived")
    subject.phonetic_code("hello").should == ["HL", nil]
  end

  it "should work with nils" do
    subject.phonetic_code(nil).should == ["", nil]
  end
end