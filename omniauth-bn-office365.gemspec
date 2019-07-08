lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('../lib/omniauth/omniauth-bn-office365/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "omniauth-bn-office365"
  gem.version       = OmniAuth::BN::OFFICE365::VERSION
  gem.authors       = ["shawn-higgins1"]
  gem.email         = ["23224097+shawn-higgins1@users.noreply.github.com"]

  gem.summary       = "An omniauth provider for Azure Active Directory"
  gem.description   = "A ruby gem for using omniauth to authenticate Azure Active Directory users"

  gem.files = 'git ls-files'.split("\n")

  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'omniauth', '>= 1.3.2'
  gem.add_runtime_dependency 'omniauth-oauth2', '>= 1.5.0'
end
