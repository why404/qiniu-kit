# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Qiniu::Kit do

  before(:all) do
    @bucket = 'bucket'
    @key = 'key'
    @encoded = 'YnVja2V0OmtleQ=='
  end

  context '.decode_json' do
    it 'should works' do
      Qiniu::Kit.decode_json('{"deadline":0,"scope":"my_bucket"}').should eq({"deadline"=>0, "scope"=>"my_bucket"})
    end
  end

  context '.encode_json' do
    it 'should works' do
      expected_result =[
        '{"deadline":0,"scope":"my_bucket"}',
        '{"scope":"my_bucket","deadline":0}'
      ]
      result = Qiniu::Kit.encode_json({"deadline"=>0, "scope"=>"my_bucket"})
      expected_result.include?(result).should be_true
    end
  end

  context '.base64_url_encode' do
    it 'should works' do
      Qiniu::Kit.base64_url_encode("#{@bucket}:#{@key}").should eq(@encoded)
    end
  end

  context '.base64_url_decode' do
    it 'should works' do
      Qiniu::Kit.base64_url_decode(@encoded).should eq("#{@bucket}:#{@key}")
    end
  end

  context '.entry_uri_encode' do
    it 'should works' do
      Qiniu::Kit.entry_uri_encode(@bucket, @key).should eq(@encoded)
    end
  end

end
