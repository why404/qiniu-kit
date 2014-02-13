# -*- encoding: utf-8 -*-

require File.join(File.dirname(__FILE__), 'qiniu', 'errors.rb')

module Qiniu

  @config = {}

  class << self

    DEFAULT_OPTIONS = {}

    attr_reader :config

    def config=(options)
      unless Hash === options
        raise ArgumentError, "configuration object must be a hash"
      end
      @config = DEFAULT_OPTIONS.merge(options)
      akid = ENV["QINIU_ACCESS_KEY"] || @config[:access_key]
      skid = ENV["QINIU_SECRET_KEY"] || @config[:secret_key]
      if akid.nil? || akid.empty? || skid.nil? || skid.nil?
        raise Qiniu::Errors::MissingCredentialsError, "missing :access_key or :secret_key"
      end
    end

  end
end
