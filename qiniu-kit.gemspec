# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qiniu/kit/version'

Gem::Specification.new do |spec|
  spec.name          = "qiniu-kit"
  spec.version       = Qiniu::Kit::VERSION
  spec.authors       = ["why404"]
  spec.email         = ["awhy.xu@gmail.com"]
  spec.summary       = %q{A collection of helpful methods for debugging Qiniu Cloud Storage API.}
  spec.description   = %q{Qiniu basic for setup other libraries, also can be used independently.}
  spec.homepage      = "https://github.com/why404/qiniu-kit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "json", "~> 1.8"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rspec", "~> 2.14"
end
