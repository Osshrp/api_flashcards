ApiFlashcards::Engine.routes.draw do
  scope module: 'api' do
    namespace 'v1' do
      get 'cards', to: 'cards#index'
      post 'cards', to: 'cards#create'
      get "review" => "trainer#review_card"
      get "train" => "trainer#index"
    end
  end
end
