Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  get   "/items/:id/comments/new",  to: "comments#new"
  post  "/items/:id/comments",      to: "comments#create", as: "item_comments"
end
