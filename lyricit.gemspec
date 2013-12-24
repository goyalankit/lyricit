# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lyricit/version'

Gem::Specification.new do |spec|
  spec.name          = "lyricit"
  spec.version       = Lyricit::VERSION
  spec.authors       = ["Ankit Goyal"]
  spec.email         = ["ankit3goyal@gmail.com"]
  spec.description   = %q{Update lyrics on iTunes from command line.}
  spec.summary       = %q{Update lyrics on iTunes by simply giving the song name from command line.}
  spec.homepage      = "http://goyalankit.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 1.3"
  spec.add_dependency "rake"
  spec.add_dependency "faraday"
end
