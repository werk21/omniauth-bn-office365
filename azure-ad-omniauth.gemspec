lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('../lib/omniauth/azure-ad-omniauth/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "azure-ad-omniauth"
  gem.version       = OmniAuth::Azure::AD::VERSION
  gem.authors       = ["shawn-higgins1"]
  gem.email         = ["23224097+shawn-higgins1@users.noreply.github.com"]

  gem.summary       = "An omniauth provider for Azure Active Directory"
  gem.description   = "A ruby gem for using omniauth and Azure Active Directory"

  gem.files = 'git ls-files'.split("\n")

  #spec.bindir        = "exe"
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'omniauth', '>= 1.3.2'
  gem.add_runtime_dependency 'omniauth-oauth2', '>= 1.5.0'
end
