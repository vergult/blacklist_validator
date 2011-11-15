# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "blacklist_validator"
  s.version     = "0.0.2"
  s.authors     = ["Axel Vergult"]
  s.email       = ["axel.vergult@gmail.com"]
  s.homepage    = "https://github.com/episko/blacklist_validator"
  s.summary     = %q{Blacklist validator for Rails 3}
  s.description = %q{Blacklist validator for Rails 3}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency("activemodel", ">= 0")
end
