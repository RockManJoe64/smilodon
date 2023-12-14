require "./../spec_helper"
require "spec-kemal"
require "./../../src/smilodon"
require "./../../src/webfinger/webfinger_resource"

include Smilodon::Webfinger

describe WebfingerResource do
  # You can use get,post,put,patch,delete to call the corresponding route.
  it "returns account" do
    get "/.well-known/webfinger?resource=acct:captain_america@marvel.social"
    response.body.should contain %{"subject": "captain_america@marvel.social"}
  end
end
