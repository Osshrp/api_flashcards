module ApiFlashcards
  module Api
    module V1
      class CardsController < ApiFlashcards::ApplicationController
        def index
          @cards = @current_user.cards.all
          render json: @cards
        end

        def create
          @card = current_user.cards.build(card_params)
          if @card.save
            render json: @card
          else
            render nothing: true
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