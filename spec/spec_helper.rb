$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'bundler'
Bundler.require(:test)
require 'spec'
require 'spec/autorun'
require 'webmock/rspec'

include WebMock

def base_url
  "http://api2.140proof.com"
end

# From http://api.140proof.com/test/ads.json
def ad_json
  fixture('ad_response')
end

def fixture(name)
  file = File.dirname(__FILE__) + "/fixtures/#{name}"
  File.read(file)
end

Spec::Runner.configure do |config|
end