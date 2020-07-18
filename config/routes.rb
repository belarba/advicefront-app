Rails.application.routes.draw do
  
  get '/contact', to: 'contact#new'
  post '/contact', to: 'contact#index'
  get '/contact/new', to: 'contact#new'
  post '/contact', to: 'contact#create'

  root to: redirect('/books')

  resources :books, only: %i[index show]
end
