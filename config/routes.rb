Rails.application.routes.draw do

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
  end

  scope module: :public do
    get 'orders/complete' => 'orders#complete', as: 'complete'
    resources :orders, only: [:new, :create, :update, :index, :show]
    post 'orders/confirm' => 'orders#confirm', as: 'confirm'
  end

  scope module: :public do
    resources :cart_items, only: [:index, :create, :update, :destroy]
  delete 'cart_items' => 'cart_items#destroys', as: 'destroys_cart_items'
  end

  scope module: :public do
    resource :customers , only: [:show, :edit, :update]
    get 'customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    patch 'customers/disposal' => 'customers#disposal', as: 'disposal'
  end

  scope module: :public do
    resources :items, only: [:index, :show]
  end

  scope module: :public do
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  end

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :admin do
    resources :orders, only: [:show, :update]
  end

  namespace :admin do
    resources :productions, only: [:update]
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
