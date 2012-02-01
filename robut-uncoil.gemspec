# -*- encoding: utf-8 -*-
# require './lib/robut_uncoil'
require File.expand_path('../lib/robut_uncoil', __FILE__)
# require 'version file' # if version file is in lib directory

Gem::Specification.new do |s|
  s.name          = 'robut-uncoil'
  s.version       = ::Robut::Plugin::RobutUncoil::VERSION
  s.authors       = ["Joel Stimson"]
  s.email         = 'contact@cleanroomstudios.com'
  s.homepage      = "https://github.com/stim371/robut-uncoil"
  s.summary       = %q{A plugin for Robut that expands short links}
  s.description   = %q{A plugin for Robut that allows users to expand shortened links right from chat}
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  # specify any dependencies here;
  s.add_development_dependency "rspec"
  s.add_development_dependency "guard-rspec"
  
  s.add_runtime_dependency "uncoil"
  s.add_runtime_dependency "robut"
end
