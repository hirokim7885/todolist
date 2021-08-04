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

  resources :lists

  root to: 'lists#index'

end