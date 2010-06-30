require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'one40_proof/multi'

describe "Ad" do
  before(:all) do
    @ad = One40Proof::Ad.new(ad_json)
  end

  it "should have byline" do
    @ad.byline.should_not be_nil
  end

  it "should have text" do
    @ad.text.should_not be_nil
  end

  it "should have type" do
    @ad.type.should_not be_nil
  end

  it "should have advertiser" do
    @ad.advertiser.should_not be_nil
  end

  it "should have tweet_url" do
    @ad.tweet_url.should_not be_nil
  end

  it "should have impression_url" do
    @ad.impression_url.should_not be_nil
  end

  it "should have click_url" do
    @ad.click_url.should_not be_nil
  end

  it "should send a get request to action_urls.impression_url" do
    stub_request(:get, @ad.impression_url)
    @ad.validate_impression!

    WebMock.should have_requested(:get, @ad.impression_url)
  end
end