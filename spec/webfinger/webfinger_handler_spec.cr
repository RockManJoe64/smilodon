require "./../spec_helper"
require "./../../src/webfinger/webfinger_handler"

include Smilodon::Webfinger

describe WebfingerHandler do
  handler = WebfingerHandler.new

  it "should return a valid webfinger response" do
    response = handler.find_account("marvel.social", "acct:captain_america@marvel.social")
  end
end
