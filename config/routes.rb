Rails.application.routes.draw do
  root 'teams#index'

  resources :mutants
  resources :teams do
    get :disbanded, on: :collection
  end
end
