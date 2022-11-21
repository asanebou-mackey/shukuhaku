Rails.application.routes.draw do
  
  get 'reservations/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'homes/index'
  get 'users/profile'
  post 'reservations/confirm' #確認画面のルート
  resources :users # get 'users/index' を書き換え
  resources :rooms
  resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
