require "bundler/gem_tasks"
require 'rubygems'
require 'rake'
require 'rspec'

desc "`rake` will default to running `rake:spec`"
task :default => :spec

desc "Run all the rspec examples"
task :spec do
  system "bundle exec rspec -c spec"
end