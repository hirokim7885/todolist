Rails.application.routes.draw do
  devise_for :accounts
  
  devise_scope :account do
    get 'sign_in', to: 'devise/sessions#new'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Copy the views from devise/sessions to users/sessions. Since the controller was changed, it won't use the default views located in devise/sessions.

  resources :lists

  root to: 'accounts/sessions#new'
  # Not required for API-only Applications

end