# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contracts/rspec/version'

Gem::Specification.new do |spec|
  spec.name          = "contracts-rspec"
  spec.version       = Contracts::RSpec::VERSION
  spec.authors       = ["Oleksii Fedorov"]
  spec.email         = ["waterlink000@gmail.com"]
  spec.summary       = %q{Plugin for contracts.ruby that fixes issues with rspec-mocks.}
  spec.description   = %q{Plugin for contracts.ruby that fixes issues with rspec-mocks.}
  spec.homepage      = "https://github.com/waterlink/contracts-rspec"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
