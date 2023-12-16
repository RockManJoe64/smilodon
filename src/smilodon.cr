require "kemal"
require "./container"

# TODO: Write documentation for `Smilodon`
module Smilodon
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

  scope = Container.scope

  Kemal.run
end
