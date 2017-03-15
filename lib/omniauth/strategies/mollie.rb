require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Mollie < OmniAuth::Strategies::OAuth2
      option :name, 'mollie'

      option :client_options, {
        site: 'https://api.mollie.nl/v1',
        authorize_url: 'https://www.mollie.com/oauth2/authorize',
        token_url: 'https://api.mollie.nl/oauth2/tokens'
      }

      option :authorize_params, {
        :state => SecureRandom.hex(24),
        :scope => 'payments.read customers.read subscriptions.read organizations.read'
      }

      def request_phase
        redirect client.auth_code.authorize_url(options.authorize_params)
      end

      uid { user_data['id'] }

      extra do
        {
          'name' => user_data['name'],
          'email' => user_data['email'],
          'address' => user_data['address'],
          'postalCode' => user_data['postalCode'],
          'city' => user_data['city'],
          'country' => user_data['country'],
          'countryCode' => user_data['countryCode'],
        }
      end

      def user_data
        conn = Faraday.new(url: 'https://api.mollie.nl/v1')
        conn.authorization :Bearer, access_token.token

        user_data ||= JSON.parse conn.get('organizations/me').body
      end
    end
  end
end
