require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "UserAd" do
  it "should request GET /ads/user.json..." do
   url = base_url + '/ads/user.json?user_id=sferik&app_id=test'
   stub_request(:get, url)
   One40Proof::Simple::UserAd.new(:user_id => 'sferik', :app_id => 'test')

   WebMock.should have_requested(:get, url)
  end
end

  