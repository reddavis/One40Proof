module One40Proof
  class Status
    
    def initialize(data)
      @data = data
    end
    
    def id
      @data['id']
    end
    
  end
end