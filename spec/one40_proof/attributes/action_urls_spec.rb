require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "ActionUrls" do
  before(:all) do
    parsed_json = JSON.parse(test_ad_data)
    @action_urls = One40Proof::ActionUrls.new(parsed_json)
  end
  
  it "should return the click_url" do
    @action_urls.click_url.should == "http://api.140proof.com/clicks/create.json?ad_id=1&impression_id=1&app_id=test&user_id=7"
  end
  
  it "should return favorite_url" do
    @action_urls.favorite_url.should == "http://api.140proof.com/favorites/create.json?ad_id=1&impression_id=1&app_id=test&user_id=7"
  end
  
  it "should return impression_url" do
    @action_urls.impression_url.should == "http://api.140proof.com/impressions/verify.json?ad_id=1&impression_id=1&app_id=test&user_id=7"
  end
  
  it "should return friendship_url" do
    @action_urls.friendship_url.should == "http://api.140proof.com/friendships/create.json?ad_id=1&impression_id=1&app_id=test&user_id=7"
  end
  
  it "should return reply url" do
    @action_urls.reply_url.should == "http://api.140proof.com/replies/create.json?ad_id=1&impression_id=1&app_id=test&user_id=7"
  end
  
  it "should return retweet_url" do
    @action_urls.retweet_url.should == "http://api.140proof.com/retweets/create.json?ad_id=1&impression_id=1&app_id=test&user_id=7"
  end
end
