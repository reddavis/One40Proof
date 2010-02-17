require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "User" do
  before(:all) do
    parsed_json = JSON.parse(test_ad_data)
    @user = One40Proof::User.new(parsed_json)
  end
  
  it "should return profile_image_url" do
    @user.profile_image_url.should == "http://img.tweetimag.es/i/Mets_n"
  end
  
  it "should return name" do
    @user.name.should == "New York Mets"
  end
  
  it "should return user_id" do
    @user.user_id.should == 39367703
  end
  
  it "should return screen_name" do
    @user.screen_name.should == "Mets"
  end
end