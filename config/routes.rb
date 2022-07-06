Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: "users/registrations" }
end
