require "kemal"
require "./webfinger/webfinger_resource"

# TODO: Write documentation for `Smilodon`
module Smilodon
  VERSION = "0.1.0"

  # TODO: Use Hardwire for dependency injection
  handler = Smilodon::Webfinger::WebfingerHandler.new
  controller = Smilodon::Webfinger::WebfingerResource.new(handler)

  Kemal.run
end
