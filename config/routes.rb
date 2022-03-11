Rails.application.routes.draw do
  namespace :admin do
    resources :genres, only: [:index, :edit, :create]
  end
  namespace :admin do
    root to: 'homes#top'
  end
  #devise_for :admins
 
  
  devise_scope :admin do
    get 'admin/sign_in', to: 'admin/sessions#new', as: 'admin_session'
    post 'admin/sign_in', to: 'admin/sessions#create'
    delete 'admin/sign_out', to: 'admin/sessions#destroy', as: 'destroy_admin_session'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
