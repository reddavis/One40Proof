require 'attributes/user'
require 'attributes/action_urls'

module One40Proof
  class Ad
    
    def initialize(data)
      @data = data['ads'][0]
    end
    
    def image_url
      @data['image_url']
    end
    
    def byline
      @data['byline']
    end
    
    def text
      @data['text']
    end
    
    def user
      @user ||= User.new(@data['user'])
    end
    
    def action_urls
      @action_urls ||= ActionUrls.new(@data['action_urls'])
    end
    
  end
end