Rails.application.routes.draw do
  root 'teams#index'

  resources :mutants
  resources :teams
end
