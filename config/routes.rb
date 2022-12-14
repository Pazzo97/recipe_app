Rails.application.routes.draw do
  get 'recipe_foods/create'
  get 'recipe_foods/destroy'
  root "home#index"

  devise_scope :user do
    # This block of code is mandatory for devise to support logout in rails 7
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  devise_for :users

  # Defines the root path route ("/")
  resources 'general_shopping_list', only: %w[index] 
  resources 'public_recipes', only: %w[index] 
  resources 'recipes', only: %w[index show destroy new create] do
    resource 'recipe_foods', only: %w[create destroy]
  end
  resources 'foods', only: %w[index new create destroy]
end
