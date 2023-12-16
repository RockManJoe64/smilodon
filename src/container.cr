require "hardwire"
require "./user/user_repository"
require "./webfinger/webfinger_resource"

module Container
  include HardWire::Container
  include Smilodon::User
  include Smilodon::Webfinger

  transient InMemoryUserRepository
  scoped WebfingerHandler
  scoped WebfingerResource
end
