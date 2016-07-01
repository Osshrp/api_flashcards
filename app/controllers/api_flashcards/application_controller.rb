module ApiFlashcards
  class ApplicationController < ActionController::Api
    protect_from_forgery with: :exception
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
