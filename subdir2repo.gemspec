# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'subdir2repo/version'

Gem::Specification.new do |spec|
  spec.name          = "subdir2repo"
  spec.version       = Subdir2repo::VERSION
  spec.authors       = ["Robert J. Berger"]
  spec.email         = ["rberger@ibd.com"]
  spec.description   = %q{Extracts a subdirectory of a git repo into its own repo}
  spec.summary       = %q{Extracts a subdirectory of a git repo into its own repo. Does nothing to the original repo}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_dependency('methadone', '~> 1.3.0')
  spec.add_development_dependency('rspec')
end
