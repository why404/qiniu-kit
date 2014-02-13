# -*- encoding: utf-8 -*-
%w(
  qiniu.rb
  qiniu/errors.rb
  qiniu/kit.rb
  qiniu/kit/mac.rb
  qiniu/kit/version.rb
).each do |f|
  require File.join(File.dirname(__FILE__), f)
end
