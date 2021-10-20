Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'home#index'
  resources :items
  get "/items/",                    to: "items#index"
  post  "/items/:id/",              to: "items#take"
  get   "/items/:id/comments/new",  to: "comments#new"
  post  "/items/:id/comments",      to: "comments#create", as: "item_comments"
end
