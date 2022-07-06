Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: "users/registrations" }

  root "home#index"
  get "home/index"
end
