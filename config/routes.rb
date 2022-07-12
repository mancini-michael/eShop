Rails.application.routes.draw do
  devise_for :oauths, :controllers => { :omniauth_callbacks => "oauths/omniauth_callbacks" }
  devise_for :user, controllers: { registrations: "users/registrations" }

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
