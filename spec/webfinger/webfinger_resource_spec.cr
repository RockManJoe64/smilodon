require "./../spec_helper"

describe "Your::Kemal::App" do
  # You can use get,post,put,patch,delete to call the corresponding route.
  it "returns account" do
    get "/.well-known/webfinger?resource=acct:captain_america@marvel.social"
    response.body.should contain %{"subject": "captain_america@marvel.social"}
  end
end
