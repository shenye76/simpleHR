Rails.application.routes.draw do
  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: "companies/sessions",
  }

  root 'companies#index'
  resources :companies, only: [:edit, :update]
  resources :employees, only: [:index, :new, :create, :edit, :update] do
    get 'task', on: :collection
    patch 'task_completed_social_insurance', on: :member
    patch 'task_completed_employment_insurance', on: :member

  end

end
