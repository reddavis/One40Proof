require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'one40_proof/simple'

describe "Base" do

  describe "200 OK" do
    before(:all) do
      stub_request(:get, base_url).to_return(:body => user_ad_data)
      @base = One40Proof::Base.new(base_url)
    end

    it "should return an ActionUrls object" do
      @base.action_urls.should be_a(One40Proof::ActionUrls)
    end

    it "should return a User object" do
      @base.user.should be_a(One40Proof::User)
    end
    
    it "should return a Status object" do
      @base.status.should be_a(One40Proof::Status)
    end

    it "should return image_url" do
      @base.image_url.should == "http://img.tweetimag.es/i/LittleSkillet_n"
    end    
    
    it "should return byline" do
      @base.byline.should == 'ads by 140 Proof'
    end
    
    it "should return text" do
      @base.text.should == "Serving up farm-fresh soul food and San Francisco's finest chicken and waffles. Follow @LittleSkillet for today's specials."
    end
  end
  
  describe "404" do
    it "should raise a NotFound" do
      stub_request(:get, base_url).to_return(:status => 404)
      
      lambda do  
        @base = One40Proof::Base.new(base_url)
      end.should raise_error(One40Proof::NotFound)
    end
  end

end
