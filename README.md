# qiniu-kit

[![Build Status](https://travis-ci.org/why404/qiniu-kit.png?branch=master)](https://travis-ci.org/why404/qiniu-kit)
[![Dependency Status](https://gemnasium.com/why404/qiniu-kit.png)](https://gemnasium.com/why404/qiniu-kit)
[![Coverage Status](https://coveralls.io/repos/why404/qiniu-kit/badge.png)](https://coveralls.io/r/why404/qiniu-kit)
[![Code Climate](https://codeclimate.com/github/why404/qiniu-kit.png)](https://codeclimate.com/github/why404/qiniu-kit)
[![Gem Version](https://badge.fury.io/rb/qiniu-kit.png)](http://badge.fury.io/rb/qiniu-kit)

A collection of helpful methods for debugging Qiniu Cloud Storage API.

## Installation

Add this line to your application's Gemfile:

    gem 'qiniu-kit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qiniu-kit

## Usage

```ruby
require 'qiniu-kit'


Qiniu::Kit.decode_json('{"abc":"def"}')
#=> {"abc" => "def"}

Qiniu::Kit.decode_json('{"abc":"def"}', :symbolize_keys => true)
#=> {:abc => "def"}

Qiniu::Kit.encode_json({:abc => 'def'})
# convert Ruby back to JSON

Qiniu::Kit.encode_json({:abc => 'def'}, :pretty => true)
# encoded in a pretty form (if supported by the coder)


Qiniu::Kit.base64_url_encode("bucket:key")
#=> "YnVja2V0OmtleQ=="

Qiniu::Kit.base64_url_decode("YnVja2V0OmtleQ==")
#=> "bucket:key"

Qiniu::Kit.entry_uri_encode("bucket", "key")
#=> "YnVja2V0OmtleQ=="


default_mac = Qiniu::Kit::Mac.new
# this will load Qiniu.config[:access_key] and Qiniu.config[:secret_key] as its args

mac = Qiniu::Kit::Mac.new("access_key", "secret_key")
#=> #<Qiniu::Kit::Mac:0x007fb87ba89040 @access_key="access_key", @secret_key="secret_key">

mac.hmac_sha1_digest('data')
#=> "A\xF3\xC2\x14\xCE\x97\xEEY5,\rC\xD5P/\xAC\xA4\xB9l\x13"

mac.base64_hmac_sha1_digest('data')
#=> "QfPCFM6X7lk1LA1D1VAvrKS5bBM="

mac.sign('data')
#=> "access_key:QfPCFM6X7lk1LA1D1VAvrKS5bBM="

mac.sign_with_data('data')
#=> "access_key:AbKufp75scn1gPkjEi1PNDcH3qg=:ZGF0YQ=="

url = 'http://domain/key?param1=value1&param2=value2'
body = nil
mac.sign_with_request(url, body)
#=> "access_key:85Q_5E2cYOMeVFg1a50nW3To2n8="
```

## Configuration

You can configure your Qiniu account access credentials globally. This is very useful to setup onther Qiniu libraries, like [qiniu-policy](https://github.com/why404/qiniu-policy).

```ruby
require 'qiniu-kit'

Qiniu.config = {:access_key => '...', :secret_key => '...'}
```

Additionally, the library will attempt to load these options from `ENV`:

    export QINIU_ACCESS_KEY='...'
    export QINIU_SECRET_KEY='...'


## TODO

- support http requests/responses

## Supported Ruby versions

This library aims to support and is [tested against](https://travis-ci.org/why404/qiniu-kit) the following Ruby implementations:

- MRI 2.1.0
- MRI 2.0.0
- MRI 1.9.3
- MRI 1.9.2
- MRI 1.8.7
- JRuby 1.7.9 in Ruby 1.8 mode
- JRuby 1.7.9 in Ruby 1.9 mode
- Ruby Enterprise Edition 1.8.7 2012.02
- Ruby (latest master)
- [JRuby](http://jruby.org/) (latest master)
- [Rubinius](http://rubini.us/)

If something doesn't work on one of these Ruby versions, it's a bug.

This library may inadvertently work (or seem to work) on other Ruby implementations, however support will only be provided for the versions listed above.

## Contributing

1. Fork it ( <https://github.com/why404/qiniu-kit/fork> )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
