require 'simple/base'

# Returns an ad. Use for testing and verifying your ad-serving code while in development.

module One40Proof
  module Simple
    class Test < Base    
    
      def initialize
        super('/test/ads.json')
      end
        
    end
  end
end