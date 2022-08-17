Rails.application.routes.draw do
  # root path
  root "home#index"

  # home routes
  get "/home/index",         to: "home#index"
  get "/category/:category", to: "home#index", as: "home"

  # user routes
  get "cart/:id",           to: "user#cart",      as: "user_cart"
  get "history/:id",        to: "user#history",   as: "user_history"
  get "user/insertion/:id", to: "user#insertion", as: "user_insertion"
  get "profile/:id",        to: "user#profile",   as: "user_profile"
  get "wishlist/:id",       to: "user#wishlist",  as: "user_wishlist"

  # user API routes
  post "/update_user/:id",               to: "api/api#user_to_seller",     as: "update_user"
  post "/restore_user/:id",              to: "api/api#seller_to_user",     as: "restore_user"

  post "/cart/add/:insertion",           to: "api/api#add_to_cart",        as: "add_cart"
  post "/wishlist/add/:insertion",       to: "api/api#add_to_wishlist",    as: "add_wishlist"

  delete "/cart/remove/:insertion",      to: "api/api#remove_to_cart",     as: "remove_cart"
  delete "/wishlist/remove/:insertion",  to: "api/api#remove_to_wishlist", as: "remove_wishlist"
  
  # insertion routes
  get "/insertion/search",  to: "insertion#search",   as: "search_insertion"
  get "/insertion/:id",     to: "insertion#show",     as: "show_insertion"

  post "/insertion",        to: "insertion#create"
  post "/insertion/:id",    to: "insertion#edit",     as: "edit_insertion"

  delete "/insertion/:id",  to: "insertion#destroy",  as: "destroy_insertion"

  get "/meeting/new/:id", to: "meeting#new", as: "meeting"
  get "/meeting/:id", to: "meeting#show", as: "show_meeting"
  post "/meeting/accept/:id", to: "meeting#accept", as: "accept_meeting"
  post "/meeting", to: "meeting#create", as: "create_meeting"
  post "/meeting/:id", to: "meeting#update", as: "edit_meeting"
  delete "/meeting/:id", to: "meeting#destroy", as: "destroy_meeting"
  
  post "/review/create", to: "review#create", as: "create_review"

  get "questions/reply"
  post "/questions", to: "questions#create"

  post "/history/insertion/:id", to: "history#complete", as: "complete_purchase"
  
  resources :questions

  # devise routes
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
end
