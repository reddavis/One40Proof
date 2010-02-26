$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'spec'
require 'spec/autorun'
require 'webmock/rspec'

include WebMock

def base_url
  "http://api.140proof.com"
end

# From http://api.140proof.com/test/ads.json
def test_ad_data
  %{{"ads":[{"status":{"id":6017128450},"byline":"ads by 140 Proof","text":"NEW #Mets 2010 Alternate Jersey can be ordered here --> http://bit.ly/8P6xYm","action_urls":{"click_url":"http://api.140proof.com/clicks/create.json?ad_id=1&impression_id=1&app_id=test&user_id=7","favorite_url":"http://api.140proof.com/favorites/create.json?ad_id=1&impression_id=1&app_id=test&user_id=7","impression_url":"http://api.140proof.com/impressions/verify.json?ad_id=1&impression_id=1&app_id=test&user_id=7","friendship_url":"http://api.140proof.com/friendships/create.json?ad_id=1&impression_id=1&app_id=test&user_id=7","reply_url":"http://api.140proof.com/replies/create.json?ad_id=1&impression_id=1&app_id=test&user_id=7","retweet_url":"http://api.140proof.com/retweets/create.json?ad_id=1&impression_id=1&app_id=test&user_id=7"},"user":{"profile_image_url":"http://img.tweetimag.es/i/Mets_n","name":"New York Mets","id":39367703,"screen_name":"Mets"},"image_url":"http://img.tweetimag.es/i/mets_b"}]}}
end

# From http://api.140proof.com/ads/user.json?user_id=sferik&app_id=test
def user_ad_data
  %{{"ads":[{"status":{"id":null},"byline":"ads by 140 Proof","text":"Serving up farm-fresh soul food and San Francisco's finest chicken and waffles. Follow @LittleSkillet for today's specials.","action_urls":{"click_url":"http://api.140proof.com/clicks/create.json?ad_id=295&impression_id=7933117&app_id=test&user_id=7505382","favorite_url":null,"impression_url":"http://api.140proof.com/impressions/verify.json?ad_id=295&impression_id=7933117&app_id=test&user_id=7505382","friendship_url":"http://api.140proof.com/friendships/create.json?ad_id=295&impression_id=7933117&app_id=test&user_id=7505382","reply_url":"http://api.140proof.com/replies/create.json?ad_id=295&impression_id=7933117&app_id=test&user_id=7505382","retweet_url":null},"user":{"profile_image_url":"http://img.tweetimag.es/i/LittleSkillet_n","name":"Little Skillet","id":27710301,"screen_name":"LittleSkillet"},"image_url":"http://img.tweetimag.es/i/LittleSkillet_n"}]}}
end

Spec::Runner.configure do |config|
  
end
