Rails.application.routes.draw do
  root 'orders#index'#定義首頁

  #resources :orders
  #order/1/comment
  resources :orders do
    member do # 客製化連結
      post :vote
      # 這樣會產出 orders/1/vote
    end
    # 嵌套/巢狀路由，這樣可以產生出 orders/1/comments/ 的 url
    resources :comments, only: [:create] do
      member do
        post :vote
        # 產出 orders/1/comments/1/vote
      end
    end
  end


  resources :users, only: [:new, :create]
  get '/register', to: 'users#new'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # config/routes.rb
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
#/config/routes.rb 是一個 Rails 專案管理路由以及相對應 Controller Action 的檔案，Rails 專案的路由都是在這裡設定