require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'one40_proof/multi'
require 'one40_proof/simple/exceptions'

describe "MultiBase" do
  describe "Good Response" do
    before do
      hydra = Typhoeus::Hydra.new
      test_response = Response.new(:code => 200, :body => test_ad_data)
  
      # I receive undefined method `request=' for #<WebMock::Response:0x7fc658> without these:
      test_response.stub!(:request=)
      # I get undefined method `code' fo WebMock (0.9.1)
      test_response.stub!(:code).and_return(200)
    
      hydra.stub(:get, /http:\/\/api.140proof.com/).and_return(test_response)
    
      Typhoeus::Hydra.stub!(:new).and_return(hydra)

      @response = One40Proof::Multi::Base.new(queries)
    end
    
    it "should return an Array of Ads" do
      @response.ads.should be_an(Array)
    end
  
    it "should create 3 ads" do
      @response.ads.size.should == 3
    end
  end
  
  describe "Error Handling" do
    before do
      hydra = Typhoeus::Hydra.new
      test_response = Response.new(:code => 404, :body => test_ad_data)
  
      # I receive undefined method `request=' for #<WebMock::Response:0x7fc658> without these:
      test_response.stub!(:request=)
      # I get undefined method `code' fo WebMock (0.9.1)
      test_response.stub!(:code).and_return(404)
    
      hydra.stub(:get, /http:\/\/api.140proof.com/).and_return(test_response)
    
      Typhoeus::Hydra.stub!(:new).and_return(hydra)
    end
    
    it "should raise an error" do
      lambda do  
        One40Proof::Multi::Base.new(queries, :on_fail => Proc.new {raise One40Proof::NotFound.new})
      end.should raise_error(One40Proof::NotFound)
    end
    
    it "should include 'hello' in ads array" do
      One40Proof::Multi::Base.new(queries, :on_fail => "Hello").ads.should include('Hello')
    end
  end
  
  def queries
    [
      {:method => :test},
      {:method => :user, :user_id => 'sferik', :app_id => 'test'},
      {:method => :search, :user_id => 'sferik', :app_id => 'test', :q => 'New York Mets'}
    ]
  end
end