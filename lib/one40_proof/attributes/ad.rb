require 'json'
require 'attributes/user'
require 'attributes/action_urls'
require 'attributes/status'
require 'net/http'

module One40Proof
  class Ad
    
    def initialize(data)
      @data = JSON.parse(data)['ads'][0]
    end
    
    def image_url
      @data['image_url']
    end
    
    # e.g "ads by Pizza Hut"
    def byline
      @data['byline']
    end
    
    # Ad text
    def text
      @data['text']
    end
    
    def user
      @user ||= User.new(@data['user'])
    end
    
    def action_urls
      @action_urls ||= ActionUrls.new(@data['action_urls'])
    end
    
    def status
      @status ||= Status.new(@data['status'])
    end
    
    def validate_impression!
      Net::HTTP.get(URI.parse(action_urls.impression_url))
    end
        
  end
end