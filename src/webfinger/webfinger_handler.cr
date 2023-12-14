module Smilodon::Webfinger
  class WebfingerHandler
    def find_account(resource : String) : String?
      # TODO: implement
      username = resource.gsub("acct:", "")
      if resource.includes? "captain_america"
        return {
          "subject": username,
          "links":   [
            {
              "rel":  "self",
              "type": "application/activity+json",
              "href": "https://marvel.social/users/#{username.split('@')[0]}",
            },
          ],
        }.to_json
      end

      nil
    end
  end
end
