Rails.application.routes.draw do
  root to: redirect('/books')

  resources :books, only: %i[index show]
end
