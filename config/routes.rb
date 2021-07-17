Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # devise_for :admins, controllers: { sessions: 'admins/sessions' }
  # Copy the views from devise/sessions to users/sessions. Since the controller was changed, it won't use the default views located in devise/sessions.

  resources :lists

  root to: "lists#index"
  # Not required for API-only Applications

end