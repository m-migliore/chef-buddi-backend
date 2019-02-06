Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :recipes, only: [:index, :show, :create, :update]
      resources :ingredients, only: [:index, :show, :update]
      resources :user_recipes, only: [:index, :show, :create,  :destroy]
      resources :user_ingredients, only: [:index, :create, :destroy]
      resources :recipe_ingredients, only: [:index, :show, :update]

      post 'recipes/find', to: 'recipes#find'
      post "/login", to: "users#login"
      post 'recipes/add', to: 'add_recipe#add'
      post 'recipes/test', to: 'add_recipe#test'
    end
  end
end
