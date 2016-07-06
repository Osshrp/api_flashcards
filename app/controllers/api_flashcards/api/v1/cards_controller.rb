module ApiFlashcards
  module Api
    module V1
      class CardsController < ApiFlashcards::ApplicationController

        # Handles a GET request /api/v1/cards
        # @return [JSON] Users cards
        def index
          @cards = @current_user.cards.all
          if @cards
            render json: @cards, status: 200
          end
        end

        # Handles a POST request, create Card
        # @param {"original_text"=>"Text", "translated_text"=>"Текст"}
        # @return [success] or status 500
        def create
          @card = @current_user.cards.build(card_params)
          if @card.save
            render json: { message: 'success' }, status: 201
          else
            render nothing: true, status: 500
          end
        end

        private

        def card_params
          params.require(:card).permit(:original_text, :translated_text,
                                       :review_date)
        end
      end
    end
  end
end