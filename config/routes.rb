Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root "home#index"

  get "/insertion/:id", to: "insertion#show", as: "show_insertion"
  post "/insertion", to: "insertion#create"
  post "/insertion/:id", to: "insertion#edit", as: "edit_insertion"
  delete "/insertion/:id", to: "insertion#delete", as: "destroy_insertion"

  get "home/index"
  get "/:category", to: "home#show", as: "category_insertions"
  post "/update_user/:id", to: "home#user_to_seller", as: "update_user"
  post "/restore_user/:id", to: "home#seller_to_user", as: "restore_user"
end
