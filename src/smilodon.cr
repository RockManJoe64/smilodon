require "kemal"
require "./user/user_repository"
require "./webfinger/webfinger_resource"

# TODO: Write documentation for `Smilodon`
module Smilodon
  VERSION = "0.1.0"

  # TODO: Use Hardwire for dependency injection
  user_repository = InMemoryUserRepository.new
  handler = Smilodon::Webfinger::WebfingerHandler.new(user_repository)
  controller = Smilodon::Webfinger::WebfingerResource.new(handler)

  Kemal.run
end
