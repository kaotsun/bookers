Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'books#top'
  get 'bookers-level1.herokuapp.com' => 'books#top'
  get 'bookers-level1.herokuapp.com/books' => 'books#index'
  get 'bookers-level1.herokuapp.com/books/:id' => 'books#show'
  post 'bookers-level1.herokuapp.com/books' => 'books#create'
  get 'bookers-level1.herokuapp.com/books/:id/edit' => 'books#edit'
  patch 'bookers-level1.herokuapp.com/books/:id' => 'books#update'
  delete 'bookers-level1.herokuapp.com/books/:id' => 'books#destroy'
end
