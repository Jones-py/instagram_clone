Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'chats/index'
  resources :sessions
  resources :users
  resources :chats do
    collection do
      post :confirm
    end
  end
end
