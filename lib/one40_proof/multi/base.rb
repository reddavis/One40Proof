require 'typhoeus'
require 'json'
require 'attributes/ad'

module One40Proof
  module Multi
    class Base
    
      def initialize(ad_requests)
        hydra = Typhoeus::Hydra.new
            
        ad_requests.each do |ad_request|
          url = build_url(ad_request.delete(:method))
        
          params = ad_request.empty? ? {} : {:params => turn_keys_to_strings(ad_request)}
          request = Typhoeus::Request.new(url, params)
        
          request.on_complete do |response|
            ads << Ad.new(JSON.parse(response.body))
          end
        
          hydra.queue(request)
        end
      
        hydra.run
      end
    
      def ads
        @ads ||= []
      end
        
      private
    
      # I get undefined method `<=>' for :user_id:Symbol in Ruby 1.8.6
      def turn_keys_to_strings(hash)
        new_hash = {}
        hash.each {|k,v| new_hash[k.to_s] = v}
        new_hash
      end
    
      def build_url(method)
        case method
        when :test
          path = '/test/ads.json'
        when :user
          path = '/ads/user.json'
        when :search
          path = '/ads/search.json'
        end
      
        base_uri + path
      end
    
      def base_uri
        "http://api.140proof.com"
      end
  
    end
  end
end