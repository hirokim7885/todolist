Rails.application.routes.draw do
  devise_for :accounts
  
  devise_scope :account do
    get 'sign_in', to: 'devise/sessions#new'
  end

  get '/lists/today', to: 'lists_today#index'

  get '/lists/business', to: 'lists_business#index'

  get '/lists/privates', to: 'lists_privates#index'

  get '/lists/complete', to: 'lists_complete#index'

  get '/lists/tomorrow', to: 'lists_tomorrow#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Copy the views from devise/sessions to users/sessions. Since the controller was changed, it won't use the default views located in devise/sessions.

  resources :lists

  root to: 'lists#index'
  # Not required for API-only Applications

end