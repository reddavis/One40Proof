require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Test" do
  describe "Connection to the service" do
   it "should request GET /test/ads.json" do
     url = base_url + '/test/ads.json'
     stub_request(:get, url)
     One40Proof::Test.new
 
     WebMock.should have_requested(:get, url)
   end
  end
end
