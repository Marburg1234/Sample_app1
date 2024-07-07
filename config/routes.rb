Rails.application.routes.draw do


  get 'top' => 'homes#top'

  get 'books' => 'books#index'
  get 'books/new' => 'books#new'
  post 'books' => 'books#create'
  get 'books/:id' => 'books#show'


  resources :books
end
