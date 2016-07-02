require "rails-api/action_controller/api"

module ApiFlashcards
  class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    before_action :authenticate

    private

    def authenticate
      if user = authenticate_with_http_basic { |user, password| User.login(user, password) }
        @current_user = user
      else
        request_http_basic_authentication
      end
    end
  end
end
