require "spec_helper"
include ActionController::HttpAuthentication::Basic::ControllerMethods

module ApiFlashcards::Api::V1
  describe TrainerController, type: :controller do
    let!(:user) {  FactoryGirl.create(:user_with_one_block_and_one_card) }
    routes { ApiFlashcards::Engine.routes }

    context "Not authenticated access" do
      describe "Get trainer#index" do
        it "has a 401 status code" do
          get :index
          expect(response.status).to eq(401)
        end
      end
    end

    context "Authenticated access" do
      include AuthHelper
      before { auth }

      describe "GET traner#index" do
        it "has a 200 status code" do
          get :index
          expect(response.status).to eq(200)
        end
      end

      describe "PUT review_card" do
        it "check wrong translation" do
          put :review_card, user_translation: 'vvv', card_id: user.cards.first.id
          expect(response).to be false
        end
      end
    end
  end
end