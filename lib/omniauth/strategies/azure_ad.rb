# frozen_string_literal: true

require 'omniauth'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    # Implements an OmniAuth strategy to get a Microsoft Graph
    # compatible token from Azure AD
    class AzureAd < OmniAuth::Strategies::OAuth2
      option :name, :azure_ad

      DEFAULT_SCOPE = 'openid email profile User.Read'

      # Configure the Azure v2 endpoints
      option  :client_options,
              site:          'https://login.microsoftonline.com',
              authorize_url: '/common/oauth2/v2.0/authorize',
              token_url:     '/common/oauth2/v2.0/token'

      # Send the scope parameter during authorize
      option :authorize_options, [:scope, :allowed_domains]

      # Unique ID for the user is the id field
      uid { raw_info['id'] }

      # Get additional information after token is retrieved
      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        # Get user profile information from the /me endpoint
        @raw_info ||= verify_hd
        @raw_info[:image] = avatar_file
        @raw_info
      end

      def authorize_params
        super.tap do |params|
          %w[display allowed_domains scope auth_type].each do |v|
            params[v.to_sym] = request.params[v] if request.params[v]
          end

          params[:scope] ||= DEFAULT_SCOPE
        end
      end

      # Override callback URL
      # OmniAuth by default passes the entire URL of the callback, including
      # query parameters. Azure fails validation because that doesn't match the
      # registered callback.
      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end

      private

      def avatar_file
        photo = access_token.get("https://graph.microsoft.com/v1.0/me/photo/$value")
        ext   = photo.content_type.sub("image/", "") # "image/jpeg" => "jpeg"

        Tempfile.new(["avatar", ".#{ext}"]).tap do |file|
          file.binmode
          file.write(photo.body)
          file.rewind
        end
      rescue ::OAuth2::Error => e
        if e.response.status == 404
          nil
        elsif e.code['code'] == 'GetUserPhoto' && e.code['message'].match('not supported')
          nil
        else
          raise
        end
      end

      def verify_hd
        token = access_token.get('https://graph.microsoft.com/v1.0/me').parsed

        return token unless options.allowed_domains

        email = token["mail"] || token["userPrincipalName"]

        unless options.allowed_domains.split(',').include?(email.split("@")[1])
          raise CallbackError.new(:invalid_hd, 'Invalid Hosted Domain')
        end

        token
      end
    end
  end
end
