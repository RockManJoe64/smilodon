require "kemal"
require "./webfinger_handler"

module Smilodon::Webfinger
  # Defines Kemal routes for the Webfinger protocol
  class WebfingerResource
    def initialize(@webfinger_handler : WebfingerHandler)
      get "/.well-known/webfinger" do |env|
        host = env.request.headers["Host"]
        resource = env.params.query["resource"]
        puts "Webfinger request for #{resource} at #{host}"
        account = @webfinger_handler.find_account(host, resource)
        if account.nil?
          halt env, status_code: 404, response: "Account Not Found"
        end

        env.response.content_type = "application/jrd+json"
        account.to_json
      end
    end
  end
end
