require_dependency "api_flashcards/application_controller"

module ApiFlashcards
  class ApiController < ApplicationController
    before_action :authenticate

    def index
      # @users = User.all
    end

    private

    def authenticate
      # if user = authenticate_with_http_basic { |user, password| login(user, password) }
      if user = authenticate_with_http_basic { |user, password| user == 'user' && password == 'password' }
        @current_user = user
      else
        request_http_basic_authentication
      end
    end
  end
end
