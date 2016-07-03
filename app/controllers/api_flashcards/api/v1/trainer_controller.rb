module ApiFlashcards
  module Api
    module V1
      class TrainerController < ApiFlashcards::ApplicationController

        def index
          find_card params[:id]
          render json: @card
        end

        def review_card
          byebug
          @card = @current_user.cards.find(params[:card_id])
          check_result = @card.check_translation(trainer_params[:user_translation])
        end

        private

        def trainer_params
          params.permit(:card_id, :user_translation)
        end
      end
    end
  end
end
