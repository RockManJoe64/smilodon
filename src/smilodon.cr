require "kemal"
require "./user/user_repository"
require "./webfinger/webfinger_resource"

# TODO: Write documentation for `Smilodon`
module Smilodon
  include User
  include Webfinger
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

  # TODO: Use dependency injection
  user_repository = InMemoryUserRepository.new
  handler = WebfingerHandler.new(user_repository)
  controller = WebfingerResource.new(handler)

  Kemal.run
end
