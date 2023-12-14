require "kemal"
require "./webfinger_handler"

module Smilodon::Webfinger
  # Defines Kemal routes for the Webfinger protocol
  class WebfingerResource
    def initialize(@webfinger_handler : WebfingerHandler)
      # TODO - handle the rel query parameter
      get "/.well-known/webfinger" do |env|
        resource = env.params.query["resource"]?
        if (resource.nil? || resource.empty?)
          halt env, status_code: 400, response: "Missing resource parameter"
        end
        account = @webfinger_handler.find_account(resource)
        if account.nil?
          halt env, status_code: 404, response: "Account Not Found"
        end

        env.response.headers["Access-Control-Allow-Origin"] = "*"
        env.response.content_type = "application/jrd+json"
        account.to_json
      end
    end
  end
end
