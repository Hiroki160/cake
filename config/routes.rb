Rails.application.routes.draw do

  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  namespace :admin do
  #アイテム
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  #ジャンル
  resources :genres, only: [:index, :create, :edit, :update]
  #会員
  resources :customers, only: [:index, :show, :edit, :update]
  end

  scope module: :public do

   #会員情報
    get 'customers/my_page' => 'customers#show'
    patch 'customers/information/edit' => 'customers#edit'
    get 'customers/information/edit' => 'customers#edit'
    get 'customers/update'
    get 'customers/confirmation'
    patch 'customers/withdrawal'
  end

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

end
