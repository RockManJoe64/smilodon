require "./../user/user_repository"

module Smilodon::Webfinger
  class WebfingerHandler
    def initialize(@repository : UserRepository)
    end

    def find_account(resource : String) : String?
      account_name = resource.gsub("acct:", "")
      username, domain = account_name.split("@")
      user = @repository.find(username)

      if user
        return {
          "subject": "acct:#{user.username}@#{domain}",
          "aliases": [
            "https://#{domain}/@#{user.username}",
            "https://#{domain}/users/#{user.username}",
          ],
          "links": [
            {
              "rel":  "self",
              "type": "application/activity+json",
              "href": "https://#{domain}/users/#{user.username}",
            },
            {
              "rel":  "http://webfinger.net/rel/profile-page",
              "type": "text/html",
              "href": "https://#{domain}/@#{user.username}",
            },
            {
              "rel":      "http://ostatus.org/schema/1.0/subscribe",
              "template": "https://#{domain}/authorize_interaction?uri={uri}",
            },
          ],
        }.to_json
      end

      nil
    end
  end
end
