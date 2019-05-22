require "rubygems"
require "bundler"
require "dotenv"
require "vcr"

Dotenv.load

Bundler.require(:default, :development)

require "axs"

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end
  config.order = :random
end

VCR.configure do |c|
  c.cassette_library_dir = "spec/cassettes"
  c.hook_into :faraday, :webmock
  c.configure_rspec_metadata!
end
