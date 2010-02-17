module One40Proof
  class ActionUrls
    
    def initialize(data)
      @data = data['ads'][0]['action_urls']
    end
    
    def click_url
      @data['click_url']
    end
    
    def favorite_url
      @data['favorite_url']
    end
    alias_method :favourite_url, :favorite_url  # For the English ;)
    
    def impression_url
      @data['impression_url']
    end
    
    def friendship_url
      @data['friendship_url']
    end
    
    def reply_url
      @data['reply_url']
    end
    
    def retweet_url
      @data['retweet_url']
    end
    
  end
end