# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "my_sortable_tables/version"

Gem::Specification.new do |s|
  s.name        = "my_sortable_tables"
  s.version     = MySortableTables::VERSION
  s.authors     = ["Brandon Farmer"]
  s.email       = ["thepooreskimojoe@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Adds sorting to controllers}
  s.description = %q{Adds sorting to controllers}

  s.rubyforge_project = "my_sortable_tables"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
