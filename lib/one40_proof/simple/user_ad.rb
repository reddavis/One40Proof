require 'simple/base'

# Returns an ad for a specified user.
# Returns an HTTP 404 error if the user does not exist, if the publisher does not exist, or if a targetted ad could not be found for the user.

module One40Proof
  class UserAd < Base

    # Parameters:

    # == Required ==
    # network. The name of the social network used for user authentication (e.g. "Twitter").
    # user_name. The user's screen name on the specified network.
    # app_name. The name of your application, as provided by 140 Proof. Use "Test" for testing.
    # app_version. The version of your application.
    # platform_name. The name of your application's platform (e.g. "Web", "BlackBerry", "iPhone", "Android", "Mac", "Windows").
    # width. The width, in pixels, of the requested ad unit (possible values: 960, 640, 480, 320, 240).

    # == Optional ==
    # format. json, xml, html, js. Defaults to json
    # platform_version. The latest version of the platform that your application supports. For "Web", please specify the latest version of HTML that your application supports.
    # autolink. Boolean ("true" or "false"). Specify whether the text in a xml, json, or jsonp response should contain HTML links. Default "true".
    # lat. The user's current latitude. Note: The valid ranges for latitude is -90.0 to +90.0 (North is positive) inclusive. This parameter will be ignored if outside that range, if it is not a number, or if there not a corresponding long parameter with this request.
    # long. The user's current longitude. Note: The valid ranges for longitude is -180.0 to +180.0 (East is positive) inclusive. This parameter will be ignored if outside that range, if it is not a number, or if there not a corresponding lat parameter with this request.
    # lang. Restricts ads to the given language, specified by an ISO 639-1 code.
    # jsonp. Specify the name of a callback function for a js response.
    def initialize(options={})
      format = options.delete(:format) || "json"
      super("/ads/user.#{format}", {:query => options})
    end

  end
end
