Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'admin/sign_in', to: 'users/sessions#new', defaults: { role: 'admin' }
    get 'therapist/sign_in', to: 'users/sessions#new', defaults: { role: 'therapist' }
    get 'client/sign_in', to: 'users/sessions#new', defaults: { role: 'client' }
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'
  get 'admin/dashboard', to: 'admin#dashboard'
  get 'therapist/dashboard', to: 'therapist#dashboard'
  get 'client/dashboard', to: 'client#dashboard'
end
