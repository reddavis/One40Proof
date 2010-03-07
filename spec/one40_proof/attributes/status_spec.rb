require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'one40_proof/multi'

describe "Status" do
  before(:all) do
    parsed_json = JSON.parse(test_ad_data)['ads'][0]['status']
    @status = One40Proof::Status.new(parsed_json)
  end
  
  it "should return status id" do
    @status.id.should == 6017128450
  end
end