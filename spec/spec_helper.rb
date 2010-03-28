$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'spec'
require 'spec/autorun'
require 'webmock/rspec'

include WebMock

def base_url
  "http://api.140proof.com"
end

# From http://api.140proof.com/test/ads.json
def test_ad_data
  fixture('test')
end

# From http://api.140proof.com/ads/user.json?user_id=sferik&app_id=test
def user_ad_data
  fixture('user')
end

def fixture(name)
  file = File.dirname(__FILE__) + "/fixtures/#{name}"
  File.read(file)
end

Spec::Runner.configure do |config|
end