require "../spec_helper"
require "../../src/user/user_repository"
require "../../src/webfinger/webfinger_handler"

include Smilodon::Webfinger
include Smilodon::User

describe WebfingerHandler do
  handler = WebfingerHandler.new(InMemoryUserRepository.new)

  describe "#find_account" do
    it "should return a valid webfinger response" do
      response = handler.find_account("acct:captain_america@marvel.social")
      response.should_not be_nil
    end

    it "should return nil" do
      response = handler.find_account("acct:red_skull@marvel.social")
      response.should be_nil
    end
  end
end
