Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  #devise_for :admins
  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    #passwords:     'admin/passwords',
    #registrations: 'admin/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
