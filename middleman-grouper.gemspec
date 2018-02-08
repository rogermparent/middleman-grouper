# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-grouper"
  s.version     = "0.6"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Roger Parent"]
  # s.email       = ["email@example.com"]
  # s.homepage    = "http://example.com"
  s.summary     = "A middleman extension to group source pages."
  s.description = "A middleman extension that allows for complex logic on directory-based groups of source pages."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 4.2.1"])
  
  # Additional dependencies
  # s.add_runtime_dependency("gem-name", "gem-version")
end
