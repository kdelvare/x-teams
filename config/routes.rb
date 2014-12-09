Rails.application.routes.draw do
  root 'teams#index'

  resources :teams, only: [:index, :show, :new, :create, :update] do
    get :disbanded, on: :collection
  end
  resources :tasks, only: [:create]
end
