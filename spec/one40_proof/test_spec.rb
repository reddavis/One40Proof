require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Test" do

  describe "Connection to the service" do
    it "should request GET /test/ads.json" do
      url = base_url + '/test/ads.json'
      stub_request(:get, url)
      One40Proof::Test.new
    
      WebMock.should have_requested(:get, url)
    end
  end
  
  describe "Test data parsing" do
    before(:all) do
      url = base_url + '/test/ads.json'
      stub_request(:get, url).to_return(:body => test_data)
      @request = One40Proof::Test.new
    end

    describe "Action URLS" do
      it "should return the click_url" do
        @request.click_url.should == "http://api.140proof.com/clicks/create.json?ad_id=1&impression_id=1&publisher_id=test&user_id=7"
      end
      
      it "should return favorite_url (american)" do
        @request.favorite_url.should == "http://api.140proof.com/favorites/create.json?ad_id=1&impression_id=1&publisher_id=test&user_id=7"
      end
      
      it "should return impression_url"
    end

  end
  
  def test_data
    %{{"ads":[{"status":{"id":6017128450},"byline":"ads by 140 Proof","text":"NEW #Mets 2010 Alternate Jersey can be ordered here --> http://bit.ly/8P6xYm","action_urls":{"click_url":"http://api.140proof.com/clicks/create.json?ad_id=1&impression_id=1&publisher_id=test&user_id=7","favorite_url":"http://api.140proof.com/favorites/create.json?ad_id=1&impression_id=1&publisher_id=test&user_id=7","impression_url":"http://api.140proof.com/impressions/verify.json?ad_id=1&impression_id=1&publisher_id=test&user_id=7","friendship_url":"http://api.140proof.com/friendships/create.json?ad_id=1&impression_id=1&publisher_id=test&user_id=7","reply_url":"http://api.140proof.com/replies/create.json?ad_id=1&impression_id=1&publisher_id=test&user_id=7","retweet_url":"http://api.140proof.com/retweets/create.json?ad_id=1&impression_id=1&publisher_id=test&user_id=7"},"user":{"profile_image_url":"http://img.tweetimag.es/i/Mets_n","name":"New York Mets","id":39367703,"screen_name":"Mets"},"image_url":"http://img.tweetimag.es/i/mets_b"}]}}
  end
end
