Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, default: {format: :json} do
    resources :memos, only: [:index, :create]
  end

  root to: 'homes#index'
  post 'create', to: 'homes#create'
  get 'detail', to: 'hpomes#detail'
  
end
