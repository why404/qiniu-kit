# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'qiniu-kit'

RSpec.configure do |config|
  config.before :all do
    Qiniu.config = {
      :access_key => ENV["QINIU_ACCESS_KEY"],
      :secret_key => ENV["QINIU_SECRET_KEY"]
    }
  end
end


if RUBY_VERSION >= "1.9.2"
  require 'coveralls'
  Coveralls.wear!
end
