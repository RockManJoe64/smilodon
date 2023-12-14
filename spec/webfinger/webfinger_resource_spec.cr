require "../spec_helper"
require "spec-kemal"
require "../../src/smilodon"
require "../../src/webfinger/webfinger_resource"

include Smilodon::Webfinger

describe WebfingerResource do
  describe "GET webfinger resource" do
    it "returns OK with body" do
      get "/.well-known/webfinger?resource=acct:captain_america@marvel.social"
      response.status_code.should eq 200
      response.headers["Content-Type"].should eq "application/jrd+json"
      response.body.should_not be_nil
    end

    it "returns Bad Request" do
      get "/.well-known/webfinger?useraccount=acct:red_skull@marvel.social"
      response.status_code.should eq 400
    end

    it "returns Not Found" do
      get "/.well-known/webfinger?resource=acct:red_skull@marvel.social"
      response.status_code.should eq 404
    end
  end
end
