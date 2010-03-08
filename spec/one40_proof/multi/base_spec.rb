require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'one40_proof/multi'

describe "MultiBase" do
  before(:all) do
    hydra = Typhoeus::Hydra.new
    test_response = Response.new(:code => 200, :body => test_ad_data)
    user_response = Response.new(:code => 200, :body => user_ad_data)
    
    # I receive undefined method `request=' for #<WebMock::Response:0x7fc658> without these:
    test_response.stub!(:request=)
    user_response.stub!(:request=)
    
    hydra.stub(:get, "http://api.140proof.com/test/ads.json").and_return(test_response)
    hydra.stub(:get, "http://api.140proof.com/ads/user.json?app_id=test&user_id=sferik").and_return(user_response)
    hydra.stub(:get, "http://api.140proof.com/ads/search.json?app_id=test&q=New+York+Mets&user_id=sferik").and_return(user_response)
    
    Typhoeus::Hydra.stub!(:new).and_return(hydra)
    
    @response = One40Proof::Multi::Base.new(queries)
  end
    
  it "should return an Array of Ads" do
    @response.ads.should be_an(Array)
  end
  
  it "should create 3 ads" do
    @response.ads.size.should == 3
  end
  
  def queries
    [
      {:method => :test},
      {:method => :user, :user_id => 'sferik', :app_id => 'test'},
      {:method => :search, :user_id => 'sferik', :app_id => 'test', :q => 'New York Mets'}
    ]
  end
end