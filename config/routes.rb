Rails.application.routes.draw do
  root 'users#new'
    resources :chats do
      collection do
        post :confirm
      end
    end
    resources :sessions, only: [:new, :create, :destroy]
    resources :users
    resources :favorites, only: [:index,:create, :destroy]
   mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  end
