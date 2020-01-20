Rails.application.routes.draw do
  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: "companies/sessions",
  }

  root 'companies#index'
  resources :companies, only: [:edit, :update]
  resources :employees, only: [:index, :new, :create, :edit, :update]

end
