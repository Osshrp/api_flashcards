ApiFlashcards::Engine.routes.draw do
  scope module: 'api_flashcards' do
    get '/api', to: 'api#index'
  end
end
