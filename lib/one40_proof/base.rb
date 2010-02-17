require 'json'

module One40Proof
  class Base
    include HTTParty
    format :json
    base_uri "http://api.140proof.com"
  end
end