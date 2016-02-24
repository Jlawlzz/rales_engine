Rails.application.routes.draw do

  namespace :api do

    namespace :v1, defaults: {format: :json} do

      resources :customers, only: [:index, :show] do

        resources :invoices, only: [:index], module: 'customers'
        resources :transactions, only: [:index], module: 'customers'

        collection do
          get :find, to: 'customers#show'
          get :random, to: 'customers#show'
          get :find_all, to: 'customers#index'
        end
      end

      resources :merchants, only: [:index, :show] do

        resources :items, only: [:index], module: 'merchants'
        resources :invoices, only: [:index], module: 'merchants'

        collection do
          get :find_all, to: 'merchants#index'
          get :find, to: 'merchants#show'
          get :random, to: 'merchants#show'
        end
      end

      resources :transactions, only: [:index, :show] do

        resources :invoice, only: [:index], module: 'transactions'

        collection do
          get :find, to: 'transactions#show'
          get :random, to: 'transactions#show'
          get :find_all, to: 'transactions#index'
        end
      end

      resources :invoices, only: [:index, :show] do

        resources :transactions, only: [:index], module: 'invoices'
        resources :invoice_items, only: [:index], module: 'invoices'
        resources :items, only: [:index], module: 'invoices'
        resources :merchant, only: [:index], module: 'invoices'
        resources :customer, only: [:index], module: 'invoices'

        collection do
          get :find, to: 'invoices#show'
          get :random, to: 'invoices#show'
          get :find_all, to: 'invoices#index'
        end
      end

      resources :invoice_items, only: [:index, :show] do

        resources :item, only: [:index], module: 'invoice_items'
        resources :invoice, only: [:index], module: 'invoice_items'

        collection do
          get :find, to: 'invoice_items#show'
          get :random, to: 'invoice_items#show'
          get :find_all, to: 'invoice_items#index'
        end
      end

      resources :items, only: [:index, :show] do

        resources :invoice_items, only: [:index], module: 'items'
        resources :merchant, only: [:index], module: 'items'

        collection do
          get :find, to: 'items#show'
          get :random, to: 'items#show'
          get :find_all, to: 'items#index'
        end
      end

    end
  end
end
