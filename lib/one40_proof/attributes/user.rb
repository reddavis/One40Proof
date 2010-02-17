module One40Proof
  class User
    
    def initialize(data)
      @data = data['ads'][0]['user']
    end
    
    def profile_image_url
      @data['profile_image_url']
    end
    
    def name
      @data['name']
    end
    
    def user_id
      @data['id']
    end
    
    def screen_name
      @data['screen_name']
    end
    
  end
end