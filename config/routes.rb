Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :update]
      resources :recipes, only: [:index, :show, :update]
      resources :ingredients, only: [:index, :show, :update]
      resources :user_recipes, only: [:index, :show, :create, :update]
      resources :user_ingredients, only: [:index, :create, :destroy]
      resources :recipe_ingredients, only: [:index, :show, :update]
      post 'recipes/find', to: 'recipes#find'
    end
  end
end
