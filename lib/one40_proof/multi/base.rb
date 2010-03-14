require 'typhoeus'
require 'attributes/ad'
require 'exceptions'

module One40Proof
  module Multi
    class Base
      
      # Takes an array of hashs that build the requests.
      # User can also specify an :on_fail option.
      def initialize(ad_requests, options={})
        on_fail = options[:on_fail]
        hydra = Typhoeus::Hydra.new
            
        ad_requests.each do |ad_request|
          url = build_url(ad_request.delete(:method))
        
          params = {:params => turn_keys_to_strings(ad_request)}
          request = Typhoeus::Request.new(url, params)
        
          request.on_complete do |response|
            handle_response(response, on_fail)
          end
        
          hydra.queue(request)
        end
      
        hydra.run
      end
    
      def ads
        @ads ||= []
      end
        
      private
      
      # The Thyphoeus response class gets sent here
      def handle_response(response, on_fail)
        if response.code == 200
          ads << Ad.new(response.body)
        else
          ads << (on_fail.respond_to?(:call) ? on_fail.call : on_fail)
        end
      end
    
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
        else
          raise One40Proof::InvalidAPICall.new
        end
      
        base_uri + path
      end
    
      def base_uri
        "http://api.140proof.com"
      end
  
    end
  end
end