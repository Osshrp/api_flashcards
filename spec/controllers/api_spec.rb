require "rails_helper"

module ApiFlashcards
  describe ApiController, type: :controller do
    let!(:user) { FactoryGirl.create(:user) }
    before do
      request.env['HTTP_AUTHORIZATION'] =
        ActionController::HttpAuthentication::Basic.encode_credentials("test@test.ru","123")
    end
    describe "Autenticate with valid credentials" do
      routes { ApiFlashcards::Engine.routes }
      it "should be successful" do
        get 'index'
        expect(response).to be_success
      end
    end
  end
end