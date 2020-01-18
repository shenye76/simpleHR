Rails.application.routes.draw do
  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: "companies/sessions",
  }
  root 'companies#edit' #後ほど変更する
  resources :companies, only: [:edit, :update]

end
