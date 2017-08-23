# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bits2words/version"

Gem::Specification.new do |spec|
  spec.name          = "bits2words"
  spec.version       = Bits2words::VERSION
  spec.authors       = ["BreakBase", "Michael Coyne", "Brian O'Connor"]
  spec.email         = ["dev@breakbase.com", "mikeycgto@gmail.com", "gatzby3jr@gmail.com"]

  spec.summary       = %q{Reversibly convert an integer ID to set of words}
  spec.description   = %q{Reversibly convert an integer ID of an arbitrary size to set of words or symbols. This gem is useful for web applications that do not want to expose the raw database ID in the URL.}
  spec.homepage      = "https://github.com/breakbase/id2words"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "integer-obfuscator", "0.1.0"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
