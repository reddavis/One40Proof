require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'one40_proof/multi'
require 'one40_proof/exceptions'

describe "MultiBase" do
  describe "Requests" do
    
    describe "Good Response" do
      before do
        http_stubbing(200)
        @response = One40Proof::Multi::Base.new(queries)
      end
    
      it "should return an Array of Ads" do
        @response.ads.should be_an(Array)
      end
  
      it "should create 3 ads" do
        @response.ads.size.should == 3
      end
    end
  
    describe "Bad Response" do
      before do
        http_stubbing(404)
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
    
  end
  
  describe "Querying an invalid 140Proof method" do
    it "should raise One40Proof::InvalidAPICall" do
      lambda do
        One40Proof::Multi::Base.new({:method => :error})
      end.should raise_error(One40Proof::InvalidAPICall)
    end
  end
  
  def queries
    [
      {:method => :test},
      {:method => :user, :user_id => 'sferik', :app_id => 'test'},
      {:method => :search, :user_id => 'sferik', :app_id => 'test', :q => 'New York Mets'}
    ]
  end
  
  def http_stubbing(code, data=test_ad_data)
    hydra = Typhoeus::Hydra.new
    response = Response.new(:code => code, :body => data)
    # I receive undefined method 'request=' for WebMock (0.9.1)
    response.stub!(:request=)
    # I receive undefined method 'code' for WebMock (0.9.1)
    response.stub!(:code).and_return(404)
    
    hydra.stub(:get, /http:\/\/api.140proof.com/).and_return(response)
    Typhoeus::Hydra.stub!(:new).and_return(hydra)
  end
end