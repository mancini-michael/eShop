Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  root "home#index"

  get 'user/profile', to: "user#profile", as: "user_profile"
  get 'user/cart', to: "user#cart", as: "user_cart"
  get 'user/wishlist', to: "user#wishlist", as: "user_wishlist"
  post "/user/update_user/:id", to: "user#user_to_seller", as: "update_user"
  post "/user/restore_user/:id", to: "user#seller_to_user", as: "restore_user"
  post "/user/cart/add/:insertion", to: "user#add_to_cart", as: "add_cart"
  post "/user/wishlist/add/:insertion", to: "user#add_to_wishlist", as: "add_wishlist"
  delete "/user/cart/remove/:insertion", to: "user#remove_to_cart", as: "remove_cart"
  delete "/user/wishlist/remove/:insertion", to: "user#remove_to_wishlist", as: "remove_wishlist"

  get "/insertion/:id", to: "insertion#show", as: "show_insertion"
  post "/insertion", to: "insertion#create"
  post "/insertion/:id", to: "insertion#edit", as: "edit_insertion"
  delete "/insertion/:id", to: "insertion#destroy", as: "destroy_insertion"

  get "home/index"
  get "/category/:category", to: "home#index", as: "home"
end
