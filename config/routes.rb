Rails.application.routes.draw do

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
  end
  scope module: :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'orders/complete'
  end
  scope module: :public do
    get 'cart_items/index'
  end
  scope module: :public do
    resource :customers , only: [:show, :edit, :update]
    get 'customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
  end
  scope module: :public do
    get 'items/index'
    get 'items/show'
  end

  scope module: :public do
    get 'addresses/index'
    get 'addresses/edit'
  end

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :admin do
    resources :orders, only: [:show, :update]
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

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
