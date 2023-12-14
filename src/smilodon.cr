require "kemal"
require "./user/user_repository"
require "./webfinger/webfinger_resource"

# TODO: Write documentation for `Smilodon`
module Smilodon
  include Smilodon::User
  include Smilodon::Webfinger
  VERSION = "0.1.0"

  # TODO: Use Hardwire for dependency injection
  user_repository = InMemoryUserRepository.new
  handler = WebfingerHandler.new(user_repository)
  controller = WebfingerResource.new(handler)

  Kemal.run
end
