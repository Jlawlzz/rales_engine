Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      get 'customers/find', to: 'customers#show'
      get 'customers/random', to: 'customers#show'
      get 'customers/find_all', to: 'customers#index'
      resources :customers
    end
  end

end
