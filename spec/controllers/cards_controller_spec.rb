require "spec_helper"
include ActionController::HttpAuthentication::Basic::ControllerMethods

module ApiFlashcards::Api::V1
  describe CardsController, type: :controller do
    let!(:user) { FactoryGirl.create(:user) }
    routes { ApiFlashcards::Engine.routes }

    context "Not authenticated access" do
      describe "Get cards#index" do
        it "has a 401 status code" do
          get :index
          expect(response.status).to eq(401)
        end
      end

      describe "Post cards#create" do
        it "has a 401 status code" do
          post :create
          expect(response.status).to eq(401)
        end
      end
    end

    context "Authenticated access" do
      include AuthHelper
      before { auth }

      describe "Get cards#index" do
        it "has a 200 status code" do
          get :index
          expect(response.status).to eq(200)
        end
      end

      describe "POST cards#create" do
        let(:params) do
            { card:
              {
                original_text: 'Test',
                translated_text: 'Тест',
                block_id: 1
              }
            }
        end
        it "has a 201 status code" do
          post :create, params
          expect(response.status).to eq(201)
        end
      end
    end
  end
end
