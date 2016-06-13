require_dependency "api_flashcards/application_controller"

module ApiFlashcards
  class ApiController < ApplicationController
    http_basic_authenticate_with name: "test", password: "test"
    
    def index
    end
  end
end
