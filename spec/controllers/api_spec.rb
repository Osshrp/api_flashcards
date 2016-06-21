require "rails_helper"

describe ApiFlashcards::ApiController do
  before do
    request.env['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::Basic.encode_credentials("user","pw")
    # @routes = ActionDispatch::Routing::RouteSet.new.tap do |r|
    #   r.draw do
    #     mount ApiFlashcards::Engine => "/api"
    #     scope module: 'api_flashcards' do
    #       get '/api', to: 'api#index'
    #     end
    #   end
    # end
  end
  describe "Get index" do
    routes { ApiFlashcards::Engine.routes }
    it "should be successful" do
      get '/api'
      expect(response).to be_success
    end
  end
end