Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "lists#index"

  resources :lists do
    resources :bookmarks, :reviews, only: [:new, :create]
  end
  resources :bookmarks, :reviews, only: [:destroy]
end
