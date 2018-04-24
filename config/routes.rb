Rails.application.routes.draw do
  root 'player#index'
  resource :player
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
