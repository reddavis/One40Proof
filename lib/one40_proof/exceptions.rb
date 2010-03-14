module One40Proof
  
  # Raised:
  # * When a user does not exists
  # * When a publisher does not exist
  # * If a targetted ad cannot be found
  class NotFound < Exception; end
  
  # Raised
  # * When a user passes an API method that doesnt exist
  class InvalidAPICall < Exception 
    def initialize
      super("Check your query hash. Only :search, :test and :user methods allows")
    end
  end
  
end