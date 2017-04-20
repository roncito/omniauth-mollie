# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/mollie/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-mollie"
  spec.version       = Omniauth::Mollie::VERSION
  spec.authors       = ["Jens Kanis"]
  spec.email         = ["me@jenskanis.nl"]

  spec.summary       = %q{Mollie Connect OAuth2 Strategy for OmniAuth 1.0.}
  spec.homepage      = "https://github.com/jenskanis/omniauth-mollie"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_dependency 'omniauth', '~> 1.3'
  spec.add_dependency 'omniauth-oauth2', '~> 1.3'
end
