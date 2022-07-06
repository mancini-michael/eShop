Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: "users/registrations" }

  root "home#index"
  get "home/index"
  post "/update_user/:id", to: "home#user_to_seller", as: "update_user"
  post "/restore_user/:id", to: "home#seller_to_user", as: "restore_user"
end
