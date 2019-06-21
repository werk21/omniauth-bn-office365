# azure-ad-ominauth

This gem allows you to use Azure Active Directory Authentication with OmniAuth for signing in users.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'azure-ad-ominauth'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install omniauth-bn-launcher

## Usage


Add the azure_ad provider to the OmniAuth.rb initializer to use the provider.

    provider :azure_ad, ENV['AZURE_APP_ID'], ENV['AZURE_APP_SECRET'],
        allowed_domains: 'gmail.com'