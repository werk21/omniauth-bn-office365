lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('../lib/omniauth/azure-ad-omniauth/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "azure-ad-omniauth"
  spec.version       = OmniAuth::Azure::AD::VERSION
  spec.authors       = ["shawn-higgins1"]
  spec.email         = ["23224097+shawn-higgins1@users.noreply.github.com"]

  spec.summary       = "An omniauth provider for Azure Active Directory"
  spec.description   = "A ruby gem for using omniauth and Azure Active Directory"

  gem.files = `git ls-files`.split("\n")
  
  #spec.bindir        = "exe"
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth', '>= 1.3.2'
  spec.add_runtime_dependency 'omniauth-oauth2', '>= 1.5.0'
end
