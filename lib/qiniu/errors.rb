# -*- encoding: utf-8 -*-

module Qiniu
  module Errors

    # Raised when a {Service} is constructed and credentials are not
    # set, or the set credentials are empty.
    class MissingCredentialsError < RuntimeError; end

    class MissingArgsError < RuntimeError
      def initialize(missing_keys)
        key_list = missing_keys.map {|key| key.to_s}.join(' and the ')
        super("You did not provide both required args. Please provide the #{key_list}.")
      end
    end

  end
end
