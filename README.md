# OmniAuth Mollie

This is a OmniAuth 1.0 strategy for Mollie Connect.

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

Add the Mollie provider to your OmniAuth initializer which contains all your providers. Replace the `ENV` credentials with your own. Important is the `{ provider_ignores_state: true }`, which is necessary in order to make it work.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :mollie, ENV['MOLLIE_CLIENT_ID'], ENV['MOLLIE_SECRET'], { provider_ignores_state: true }
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/omniauth-mollie.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

