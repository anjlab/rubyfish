require "bundler"
Bundler.setup

require "rspec"
require "rubyfish"
require "support/matchers"

Rspec.configure do |config|
  config.include ::RubyFish::Spec::Matchers
end