Rails.application.routes.draw do

  mount ApiFlashcards::Engine => "/api_flashcards"
  scope module: 'api_flashcards' do
    get 'api' => 'api#index'
  end
end
