require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'one40_proof/multi'

describe "Ad" do
  before(:all) do
    @ad = One40Proof::Ad.new(test_ad_data)
  end
  
  it "should have an image_url" do
    @ad.image_url.should_not be_nil
  end
  
  it "should have byline" do
    @ad.byline.should_not be_nil
  end
  
  it "should have text" do
    @ad.text.should_not be_nil
  end
  
  it "should return a User object" do
    @ad.user.should be_a(One40Proof::User)
  end
  
  it "should return an ActionUrls object" do
    @ad.action_urls.should be_a(One40Proof::ActionUrls)
  end
  
  it "should return a Status object" do
    @ad.status.should be_a(One40Proof::Status)
  end
end