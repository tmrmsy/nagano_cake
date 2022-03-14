Rails.application.routes.draw do

  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'orders/complete'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/withdrawal'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  devise_for :customers
  
  namespace :admin do
    resources :orders, only: [:show]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace :admin do
    root to: 'homes#top'
  end

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admin/sign_in', to: 'admin/sessions#new', as: 'admin_session'
    post 'admin/sign_in', to: 'admin/sessions#create'
    delete 'admin/sign_out', to: 'admin/sessions#destroy', as: 'destroy_admin_session'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
