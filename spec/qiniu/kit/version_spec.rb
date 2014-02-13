# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Qiniu::Kit::VERSION do

  it 'should have a version number' do
    Qiniu::Kit::VERSION.should_not be_nil
  end

  it 'should be number' do
    Qiniu::Kit::VERSION.to_s.should =~ /^\d+\.\d+\.\d+?$/
  end

end
