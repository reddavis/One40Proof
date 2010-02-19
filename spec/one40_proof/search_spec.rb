require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Search" do
  it "should request GET /ads/search.json..." do
    url = base_url + '/ads/search.json?user_id=sferik&app_id=test&q=New%20York%20Mets'
    stub_request(:get, url)
    One40Proof::Search.new(:user_id => 'sferik', :app_id => 'test', :q => 'New York Mets')
  
    WebMock.should have_requested(:get, url)
  end
end
