Rails.application.routes.draw do


  #顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者用
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
  #アイテム
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  #ジャンル
  resources :genres, only: [:index, :create, :edit, :update]
  #会員
  resources :customers, only: [:index, :show, :edit, :update]
  # 注文
  resources :orders, only: [:show, :update]
  get '' => "orders#top"
  end

  scope module: :public do
  root to: 'homes#top'
  get 'homes/about'

   #会員情報
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/update'
    get 'customers/confirmation'
    patch 'customers/withdrawal'
  # 配送先
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  # アイテム
    resources :items, only: [:index, :show]
  # カート
    delete 'cart_items/destroy_all'
    get 'orders/confirm' => 'orders#confirm'
    resources :cart_items, only: [:index, :update, :destroy, :create]
  #オーダー
    resources :orders, only: [:new, :create, :index, :show]
  end




end

