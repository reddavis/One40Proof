require 'httparty'
require 'attributes/ad'
require 'exceptions'

module One40Proof
  class Base
    include HTTParty  
    format :json
    base_uri "http://api.140proof.com"
    
    def initialize(url, options={})
      validate_response(Base.get(url, options))
    end
    
    def action_urls
      ad.action_urls
    end
        
    def user
      ad.user
    end
    
    def status
      ad.status
    end
    
    def image_url
      ad.image_url
    end
    
    def byline
      ad.byline
    end
    
    def text
      ad.text
    end
    
    def validate_impression!
      ad.validate_impression!
    end
        
    private
            
    def ad
      @ad ||= Ad.new(@response.body)
    end
    
    def validate_response(response)
      if response.code == 404
        raise NotFound.new("Either user/publisher/targetted ad cannot be found")
      else
        @response = response
      end
    end
  end
end