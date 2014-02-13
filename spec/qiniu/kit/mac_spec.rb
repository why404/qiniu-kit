# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Qiniu::Kit::Mac do

  before(:all) do
    @mac_object = Qiniu::Kit::Mac.new("access_key", "secret_key")
    @data = 'The quick brown fox jumps over the lazy dog'
  end

  context '.hmac_sha1_digest' do
    it 'should works' do
      @mac_object.hmac_sha1_digest(@data).size.should eq(20)
    end
  end

  context '.base64_hmac_sha1_digest' do
    it 'should works' do
      @mac_object.base64_hmac_sha1_digest(@data).should eq("MuPjQo_SKFFla-gElUbMr6YJ_3M=")
    end
  end

  context '.sign' do
    it 'should works' do
      result = 'access_key:MuPjQo_SKFFla-gElUbMr6YJ_3M='
      @mac_object.sign(@data).should eq(result)
    end
  end

  context '.sign_with_data' do
    it 'should works' do
      result = 'access_key:o596toAWk5uj15G8YPpEItyWfAk=:VGhlIHF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZw=='
      @mac_object.sign_with_data(@data).should eq(result)
    end
  end

  context '.sign_with_request' do
    it 'should works' do
      url = 'http://foo.com/posts?id=30&limit=5#time=1305298413'
      body = nil
      result = 'access_key:rCCViSFht5oGE2oAOakBG62wbJA='
      @mac_object.sign_with_request(url, body).should eq(result)
    end
  end

end
