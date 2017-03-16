# OmniAuth::Mollie

[![Gem Version](https://img.shields.io/gem/v/omniauth-mollie.svg)](https://rubygems.org/gems/omniauth-mollie)
[![Gem Downloads](https://img.shields.io/gem/dt/omniauth-mollie.svg)](https://rubygems.org/gems/omniauth-mollie)
[![License](https://img.shields.io/badge/License-MIT_License-blue.svg)](https://github.com/jenskanis/omniauth-mollie/blob/master/LICENSE)

This is a OmniAuth 1.0 strategy for [Mollie Connect](https://www.mollie.com/en/docs/oauth/overview).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-mollie'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-mollie

## Usage

### 1. Add the Rack Middleware and configure Mollie Credentials

Add the Mollie provider to your OmniAuth initializer or create one in `config/initializers/omniauth.rb`. 

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :mollie, ENV['MOLLIE_CLIENT_ID'], ENV['MOLLIE_CLIENT_SECRET'], { provider_ignores_state: true }
end
```

Important is the `{ provider_ignores_state: true }`, which is necessary in order to make it work. Replace `ENV['MOLLIE_CLIENT_ID']` and `ENV['MOLLIE_SECRET']` credentials with yours. To aquire these credentials, you'll have to create a [Mollie Application](https://www.mollie.com/dashboard/settings/applications).


Use the following redirect URL: `https://[YOUR DOMAIN]/auth/mollie/callback`

### 2. Connect with Mollie

After you set up the Rack Middeware and configured Mollie Credentials, you're ready to let users connect with Mollie. To do, let users to go `/auth/mollie`, which will redirect you to Mollie and connect.

When you are connected, you'll receive an Auth Hash back from calling `request.env['omniauth.auth']`. This is an example Auth Hash:

```ruby
{
  "provider" => "mollie",
  "uid" => "<MOLLIE_ORGANIZATION_ID>",
  "credentials" => {
    "token" => "<MOLLIE_ACCESS_TOKEN>",
    "refresh_token" => "<MOLLIE_REFRESH_TOKEN>",
    "expires" => 1489583888,
  },
  "extra"=> {
    "name" =>"<MOLLIE_ORGANIZATION_NAME>",
    "email" => "<MOLLIE_ORGANIZATION_EMAIL>",
    "address" => "<MOLLIE_ORGANIZATION_ADDRESS>",
    "postalCode" => "<MOLLIE_ORGANIZATION_POSTAL_CODE>",
    "city" => "<MOLLIE_ORGANIZATION_CITY>",
    "country" => "<MOLLIE_ORGANIZATION_COUNTRY>",
    "countryCode" => "<MOLLIE_ORGANIZATION_COUNTRY_CODE>",
  },
}
```

## Known limitations

1. This only allows you to have the following [Mollie Permissions](https://www.mollie.com/nl/docs/oauth/permissions): `payments.read, customers.read, subscriptions.read, organizations.read`. Please create a pull request if you'd like the gem to have more permissions.

2. Mollie's access tokens expire in **1 hour**, and their refresh tokens expire in **2 weeks**. I contacted Mollie to extend this period or completely remove expirations from access tokens, but have yet to do this. Please [contact Mollie](https://help.mollie.com/hc/en/requests/new) to convince them to do the latter.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jenskanis/omniauth-mollie.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

