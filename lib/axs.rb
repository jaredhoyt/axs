require "axs/version"
require "dry-configurable"

module Axs
  extend Dry::Configurable

  setting :endpoint, "https://app.axs.com/"
  setting :proxy
  setting :api_key

  autoload :Client, "axs/client"
end
