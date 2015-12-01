Rails.application.routes.draw do
  # get 'users/new'

  # get 'users/show'

  # get 'users/create'

  resources :users, only: [:new, :show, :create]

  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'

end
