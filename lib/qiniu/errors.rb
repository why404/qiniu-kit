# -*- encoding: utf-8 -*-

module Qiniu
  module Errors

    class JSONDecodeError < StandardError; end

    class NotAnInstanceOfError < StandardError; end

    # Raised when a {Service} is constructed and credentials are not
    # set, or the set credentials are empty.
    class MissingCredentialsError < RuntimeError; end

    class MissingArgsError < RuntimeError
      def initialize(missing_keys)
        key_list = missing_keys.map {|key| key.to_s}.join(' and the ')
        super("#{key_list} are required.")
      end
    end

  end
end
