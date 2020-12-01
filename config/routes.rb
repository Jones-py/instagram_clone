Rails.application.routes.draw do
  get 'chats/index'
  resources :chats do
    collection do
      post :confirm
    end
  end
end
