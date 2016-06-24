require "rails_helper"

module ApiFlashcards
  describe ApiController, type: :controller do
    
    before do
      request.env['HTTP_AUTHORIZATION'] =
        ActionController::HttpAuthentication::Basic.encode_credentials("user","password")
    end
    describe "Get index" do
      routes { ApiFlashcards::Engine.routes }
      it "should be successful" do
        get 'index'
        expect(response).to be_success
      end
    end
  end
end