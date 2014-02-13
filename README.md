# qiniu-kit

A collection of helpful methods for debugging Qiniu Cloud Storage API.

## Installation

Add this line to your application's Gemfile:

    gem 'qiniu-kit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qiniu-kit

## Configuration

At a minimum, you need to configure your Qiniu account access credentials. You can supply these globally or per service object.

```ruby
# Qiniu.config is used for default configuration.
# You can construct service object with the same options.
Qiniu.config = {:access_key => '...', :secret_key => '...'}
```

Additionally, the gem will attempt to load these options from `ENV`:

    export QINIU_ACCESS_KEY='...'
    export QINIU_SECRET_KEY='...'


## Usage

```ruby
require 'qiniu-kit'


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

## Contributing

1. Fork it ( <https://github.com/why404/qiniu-kit/fork> )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
