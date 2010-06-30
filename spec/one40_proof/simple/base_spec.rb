require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'one40_proof/simple'

describe One40Proof::Base do

  describe "200 OK" do
    before(:all) do
      stub_request(:get, base_url).to_return(:body => ad_json)
      @base = One40Proof::Base.new(base_url)
    end

    it "should respond to type" do
      @base.should respond_to(:type)
    end

    it "should respond to byline" do
      @base.should respond_to(:byline)
    end

    it "should respond to text" do
      @base.should respond_to(:text)
    end

    it "should respond to advertiser" do
      @base.should respond_to(:advertiser)
    end

    it "should respond to tweet_url" do
      @base.should respond_to(:tweet_url)
    end

    it "should respond to impression_url" do
      @base.should respond_to(:impression_url)
    end

    it "should respond to click_url" do
      @base.should respond_to(:click_url)
    end

    it "should send a get request to action_urls.impression_url" do
      stub_request(:get, @base.impression_url)
      @base.validate_impression!

      WebMock.should have_requested(:get, @base.impression_url)
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
