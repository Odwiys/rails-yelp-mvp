Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "tasks", to: "tasks#index"
  # get "tasks/new", to: "tasks#new"
  # get "tasks/:id", to: "tasks#show", as: :task
  # get "tasks/:id/edit", to: "tasks#edit", as: :task_edit

  # post "tasks", to: "tasks#create"
  # patch "tasks/:id", to: "tasks#update"
  # delete "tasks/:id", to: "tasks#destroy"

  # See list of restaurants
  # get 'restaurants', to: 'restaurants#index'

  # # A visitor can add a new restaurant, and be redirected to the show view of that new restaurant.
  # get 'restaurants/new', to: 'restaurantes#new'
  # post 'restaurants', to: 'restaurantes#show'

  # # A visitor can see the details of a restaurant, with all the reviews related to the restaurant.
  # get 'restaurants/:id', to: 'restaurants#index'

  # # A visitor can add a new review to a restaurant
  # get 'restaurants/:restaurant_id/reviews'

  resources :restaurants, only: [:index, :new, :show, :create] do
    resources :reviews, only: [:create]
  end

  resources :reviews, only: [:create]
end
