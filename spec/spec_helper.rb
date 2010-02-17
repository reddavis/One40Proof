$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'one40_proof'
require 'spec'
require 'spec/autorun'
require 'webmock/rspec'

include WebMock

def base_url
  "http://api.140proof.com"
end

Spec::Runner.configure do |config|
  
end
