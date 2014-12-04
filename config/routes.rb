Rails.application.routes.draw do
  root 'teams#index'

  resource :teams
end
