require "rails-api/action_controller/api"

module ApiFlashcards
  class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    include ActionController::MimeResponds
    before_action :authenticate

    def find_card(id)
      if id
        @card = @current_user.cards.find id
      elsif @current_user.current_block
        @card = @current_user.current_block.cards.pending.first
        @card ||= @current_user.current_block.cards.repeating.first
      else
        @card = @current_user.cards.pending.first
        @card ||= @current_user.cards.repeating.first
      end

      # respond_to do |format|
      #   # format.html
      #   format.json
      # end
    end

    private

    def authenticate
      if user = authenticate_with_http_basic { |user, password| User.authenticate(user, password) }
        @current_user = user
      else
        request_http_basic_authentication
      end
    end
  end
end
