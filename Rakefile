#!/usr/bin/env rake

require "bundler"
require "bundler/gem_tasks"

Bundler.setup

require "rspec/core/rake_task"

#Rspec::Core::RakeTask.new(:spec)

gemspec = eval(File.read("rubyfish.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["rubyfish.gemspec"] do
  system "gem build rubyfish.gemspec"
  system "gem install rubyfish-#{RubyFish::VERSION}.gem"
end