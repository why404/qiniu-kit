# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Qiniu::Kit do

  it 'should have a version number' do
    Qiniu::Kit::VERSION.should_not be_nil
  end

  it 'version should be number' do
    Qiniu::Kit::VERSION.to_s.should =~ /^\d+\.\d+\.\d+?$/
  end

end
