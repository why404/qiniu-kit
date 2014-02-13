# -*- encoding: utf-8 -*-

require 'openssl'
require 'uri'

module Qiniu
  module Kit
    class Mac

      def initialize(access_key, secret_key)
        @access_key = access_key || Qiniu.config[:access_key]
        @secret_key = secret_key || Qiniu.config[:secret_key]
      end

      def hmac_sha1_digest(data)
        OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'), @secret_key, data)
      end

      def base64_hmac_sha1_digest(data)
        return Qiniu::Kit.base64_url_encode(hmac_sha1_digest(data))
      end

      def sign(data)
        return %Q(#{@access_key}:#{base64_hmac_sha1_digest(data)})
      end

      def sign_with_data(data)
        base64data = Qiniu::Kit.base64_url_encode(data)
        return %Q(#{sign(base64data)}:#{base64data})
      end

      def sign_with_request(url, body = nil)
        uri = URI.parse(url)
        data  = uri.path
        data += '?' + uri.query if !uri.query.nil? && !uri.query.empty?
        data += "\n"
        data += body if !body.nil? && !body.empty?
        return sign(data)
      end

    end
  end
end
