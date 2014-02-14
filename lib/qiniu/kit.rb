# -*- encoding: utf-8 -*-

require "base64"
require "multi_json"


module Qiniu
  module Kit

    module_function

    def base64_url_encode(str)
      Base64.encode64(str).tr("+/", "-_").gsub(/[\n\r]?/, "")
    end

    def base64_url_decode(str)
      Base64.decode64(str.tr("-_", "+/"))
    end

    def entry_uri_encode(bucket, key)
      entry_uri = bucket + ':' + key
      base64_url_encode(entry_uri)
    end

    def decode_json(*args)
      MultiJson.load(*args)
    rescue MultiJson::LoadError
      raise Qiniu::JSONDecodeError.new("Invalid segment encoding")
    end

    def encode_json(*args)
      MultiJson.dump(*args)
    end

  end
end
