Rails.application.routes.draw do

  namespace :public do
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/confirmation'
    get 'customers/withdrawal'
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
