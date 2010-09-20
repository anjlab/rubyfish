require File.expand_path("../lib/rubyfish/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rubyfish"
  s.version     = RubyFish::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Yury Korolev"]
  s.email       = ["yury.korolev@gmail.com"]
  s.homepage    = "http://github.com/anjlab/rubyfish"
  s.summary     = "Library for doing approximate and phonetic matching of string"
  s.description = "Port of http://github.com/sunlightlabs/jellyfish"

  s.required_rubygems_version = ">= 1.3.6"

  # lol - required for validation
  s.rubyforge_project         = "rubyfish"

  # If you have other dependencies, add them here
  # s.add_dependency "another", "~> 1.2"

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path = 'lib'

  # If you need an executable, add it here
  # s.executables = ["rubyfish"]

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"
end