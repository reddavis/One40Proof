require 'one40_proof/base'

module One40Proof
  class Test < Base    
    
    def initialize
      @response = Test.get('/test/ads.json')
    end
    
    def click_url
      action_urls['click_url']
    end
    
    def favorite_url
      action_urls['favorite_url']
    end
    alias_method :favourite_url, :favorite_url  # For the English
    
    private
    
    def action_urls
      json['action_urls']
    end
    
    def json
      @json ||= JSON.parse(@response.body)['ads'][0]
    end
    
  end
end