require 'json'
require 'net/http'

module One40Proof
  class Ad

    def initialize(data)
      @data = JSON.parse(data)['ads'][0]
    end

    def type
      @data['type']
    end

    # e.g "ads by Pizza Hut"
    def byline
      @data['byline']
    end

    # Ad text
    def text
      @data['text']
    end

    def advertiser
      @data['advertiser']
    end

    def tweet_url
      @data['tweet_url']
    end

    def impression_url
      @data['impression_url']
    end

    def click_url
      @data['click_url']
    end

    # The ad's impression_url must be requested (using the GET method) when an ad unit is displayed (for verification purposes).
    def validate_impression!
      Net::HTTP.get(URI.parse(impression_url))
    end

  end
end