require 'one40_proof/base'

# Returns an ad for a specified user. 
# Returns an HTTP 404 error if the user does not exist, if the publisher does not exist, or if a targetted ad could not be found for the user.

module One40Proof
  class Search < Base    
    
    # Options:
    # * user_id. Required. The Twitter ID or screen name of a user.
    # * app_id. Required. Your 140 Proof app id.
    # * q. Required. The query the user entered. Query strings should be URL encoded. Queries are limited 140 URL encoded characters.
    # * lat. Optional. The user's current latitude. Note: The valid ranges for latitude is -90.0 to +90.0 (North is positive) inclusive. 
    #   This parameter will be ignored if outside that range, if it is not a number, or if there not a corresponding long parameter with this request.
    # * long. Optional. The user's current longitude. Note: 
    #   The valid ranges for longitude is -180.0 to +180.0 (East is positive) inclusive. 
    #   This parameter will be ignored if outside that range, if it is not a number, or if there not a corresponding lat parameter with this request.
    # * lang. Optional. Restricts ads to the given language, specified by an ISO 639-1 code - http://en.wikipedia.org/wiki/ISO_639-1
    def initialize(options={})
      super('/ads/search.json', {:query => options})
    end
        
  end
end
