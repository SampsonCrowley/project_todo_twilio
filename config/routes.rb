Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  resources :tasks, only: [:index, :new, :show, :create, :destroy, :edit, :update]
  post '/reminder/:id', to: 'texts#send_text', as: :reminder
end
