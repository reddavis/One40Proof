require "rubygems"
require "bundler"
Bundler.require(:default, :multi)

require 'attributes/ad'
require 'exceptions'

module One40Proof
  module Multi
    class UserAd

      # Takes an array of hashs that build the requests.
      # User can also specify an :on_fail option.
      def initialize(ad_requests, options={})
        on_fail = options[:on_fail]
        hydra = Typhoeus::Hydra.new

        ad_requests.each do |ad_request|
          format = ad_request.delete(:format) || "json"

          params = {:params => turn_keys_to_strings(ad_request)}
          request = Typhoeus::Request.new(url(format), params)

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

      def url(format)
        "http://api2.140proof.com/ads/user.#{format}"
      end

    end
  end
end