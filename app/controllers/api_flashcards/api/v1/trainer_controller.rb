module ApiFlashcards
  module Api
    module V1
      class TrainerController < ApiFlashcards::ApplicationController

        # Handles a GET request /api/v1/trainer, show card for review
        # @return [json] card for review
        def index
          FindCard.find params[:id], @current_user
          if @card
            render json: @card, status: 200
          end
        end

        # PUT request, review card
        # @param [Json] user_translation, card_id
        # @return [true, false]
        def review_card
          @card = @current_user.cards.find(params[:card_id])
          check_result = @card.check_translation(trainer_params[:user_translation])
          render json: { state: check_result[:state] }
        end

        private

        def trainer_params
          params.permit(:card_id, :user_translation)
        end
      end
    end
  end
end
