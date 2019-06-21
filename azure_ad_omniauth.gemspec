lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('../lib/OmniAuth/azure-ad-omniauth/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "azure-ad-omniauth"
  spec.version       = OmniAuth::Azure::AD::VERSION
  spec.authors       = ["shawn-higgins1"]
  spec.email         = ["23224097+shawn-higgins1@users.noreply.github.com"]

  spec.summary       = "An omniauth provider for Azure Active Directory"
  spec.description   = "A ruby gem for using omniauth and Azure Active Directory"

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0.1"
  spec.add_development_dependency 'omniauth-oauth2', '~> 1.6.0'
  spec.add_development_dependency 'omniauth', '~> 1.9.0'
  spec.add_runtime_dependency 'omniauth', '~> 1.9.0'
  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.6.0'
end