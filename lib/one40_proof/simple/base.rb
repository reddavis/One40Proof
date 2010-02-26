require 'httparty'
require 'json'
require 'attributes/action_urls'
require 'attributes/user'
require 'simple/exceptions'

module One40Proof
  class Base
    include HTTParty
    format :json
    base_uri "http://api.140proof.com"
    
    def initialize(url, options={})
      validate_response(Base.get(url, options))
    end
    
    def action_urls
      @action_urls ||= ActionUrls.new(json['action_urls'])
    end
        
    def user
      @user ||= User.new(json['user'])
    end
    
    def image_url
      json['image_url']
    end
    
    # e.g "ads by Pizza Hut"
    def byline
      json['byline']
    end
    
    # Ad text
    def text
      json['text']
    end
    
    private
            
    def json
      @json ||= JSON.parse(@response.body)['ads'][0]
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