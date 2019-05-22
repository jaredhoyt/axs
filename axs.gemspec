
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "axs/version"

Gem::Specification.new do |spec|
  spec.name          = "axs"
  spec.version       = Axs::VERSION
  spec.authors       = ["Matt White"]
  spec.email         = ["mwhite@goldstar.com"]

  spec.summary       = %q{AXS API wrapper}
  spec.description   = %q{AXS API wrapper}
  spec.homepage      = "https://github.com/goldstar/axs"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "artisanal-model"
  spec.add_runtime_dependency "dry-configurable", "~> 0.7.0"
  spec.add_runtime_dependency "dry-types", "~> 0.13.0"
  spec.add_runtime_dependency "faraday", "< 0.15"
  spec.add_runtime_dependency "faraday_middleware", '< 0.13'

  spec.add_development_dependency "bundler", "~> 1.17.3"
  spec.add_development_dependency "dotenv", '~> 2.0'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", '~> 0.10'
  spec.add_development_dependency "rspec", '~> 3.3'
  spec.add_development_dependency "rspec-its", '~> 1.2'
  spec.add_development_dependency "vcr", '~> 4.0.0'
  spec.add_development_dependency "webmock", '~> 3.5.1'
end
