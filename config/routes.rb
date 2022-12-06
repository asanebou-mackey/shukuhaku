Rails.application.routes.draw do
  
  root to: 'homes#index' #ルートパス
  get 'reservations/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'homes/index'
  get 'users/profile'
  post 'reservations/confirm' #確認画面のルート
  resources :users # get 'users/index' を書き換え
  resources :rooms do
    #検索フォーム
    collection do
      get 'search'
    end
    #ここまで
  end

  resources :reservations
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
