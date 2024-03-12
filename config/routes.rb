Rails.application.routes.draw do # rubocop:disable Style/FrozenStringLiteralComment
  # This will connect users to the devise auth
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # This defines the response for GET "/" and routes to home controller's "index" method
  root 'entry#index'

  resources :projects

  get 'home', to: 'home#index'

  namespace :admin do
    resources :users, only: %i[index show update]
  end
  #
  #
  #
  #
  #
  #
  #
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end
