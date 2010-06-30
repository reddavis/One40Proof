require "rubygems"
require "bundler"
Bundler.require(:default, :simple)

require 'attributes/ad'
require 'exceptions'

module One40Proof
  class Base
    include HTTParty
    format :json
    base_uri "http://api2.140proof.com"

    def initialize(url, options={})
      validate_response(Base.get(url, options))
    end

    def type
      ad.type
    end

    def byline
      ad.byline
    end

    def text
      ad.text
    end

    def advertiser
      ad.advertiser
    end

    def tweet_url
      ad.tweet_url
    end

    def impression_url
      ad.impression_url
    end

    def click_url
      ad.click_url
    end

    # The ad's impression_url must be requested (using the GET method) when an ad unit is displayed (for verification purposes).
    def validate_impression!
      ad.validate_impression!
    end

    private

    def ad
      @ad ||= Ad.new(@response.body)
    end

    def validate_response(response)
      if response.code == 404
        raise NotFound.new("Either user/publisher/targetted ad cannot be found")
      else
        @response = response
      end
    end
  end
end