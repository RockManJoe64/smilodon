module Smilodon::Webfinger
  class WebfingerHandler
    def find_account(hostname : String, resource : String)
      # TODO: implement
      username = resource.gsub("acct:", "")
      if resource.includes? "marvel"
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
