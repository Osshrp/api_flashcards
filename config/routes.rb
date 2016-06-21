ApiFlashcards::Engine.routes.draw do
  mount ApiFlashcards::Engine => "/api"
    scope module: 'api_flashcards' do
      get '/api', to: 'api#index'
    end
end
