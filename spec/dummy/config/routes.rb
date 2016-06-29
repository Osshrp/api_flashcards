Rails.application.routes.draw do

  mount ApiFlashcards::Engine => "/api"
  scope module: 'api_flashcards' do
    get 'api' => 'api#index'
  end
end
