Rails.application.routes.draw do
  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: "companies/sessions",
  }
<<<<<<< Updated upstream
  root 'companies#edit' #後ほど変更する
=======
  root 'companies#index'
>>>>>>> Stashed changes
  resources :companies, only: [:edit, :update]

end
