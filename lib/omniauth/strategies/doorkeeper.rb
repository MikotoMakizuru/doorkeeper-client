module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      option :name, :doorkeeper

      option :client_options,
             site: ENV["DOORKEEPER_APP_URL"],
             authorize_path: "/oauth/authorize"

      uid do
        raw_info["id"]
      end

      info do
        {
          name: raw_info["login_name"],
          email: raw_info["email"]
        }
      end

      def raw_info
        raw_info ||= access_token.get("/api/users/show").parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
