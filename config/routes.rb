Rails.application.routes.draw do
  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: "companies/sessions",
  }
  root 'employees#new' #後ほど変更する
  resources :companies, only: [:edit, :update]
  resources :employees, only: [:new, :create]

end
