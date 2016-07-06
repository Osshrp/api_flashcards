ApiFlashcards::Engine.routes.draw do
  scope module: 'api' do
    namespace 'v1' do
      resources :cards, only: [:index, :create]
      get "train" => "trainer#index"
      put "review" => "trainer#review_card"
    end
  end
end
