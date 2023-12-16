require "../spec_helper"
require "../../src/user/user_repository"
require "../../src/webfinger/webfinger_handler"

include Smilodon::Webfinger
include Smilodon::User

describe WebfingerHandler do
  handler = WebfingerHandler.new(InMemoryUserRepository.new)

  describe "#find_account" do
    it "should return a valid webfinger response" do
      resource = "acct:captain_america@marvel.social"
      response = handler.find_account(resource)
      response.should_not be_nil
      account = response.as(NamedTuple)
      account[:subject].should eq resource
      account[:aliases].should eq [
        "https://marvel.social/@captain_america",
        "https://marvel.social/users/captain_america",
      ]
      # TODO: Validate links
    end

    it "should return nil" do
      response = handler.find_account("acct:red_skull@marvel.social")
      response.should be_nil
    end
  end
end
