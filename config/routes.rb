Rails.application.routes.draw do

  namespace :api do

    namespace :v1, defaults: {format: :json} do

      resources :customers, only: [:index, :show] do

        get '/favorite_merchant', to: 'customers/favorite_merchant#show'
        resources :invoices, only: [:index], module: 'customers'
        resources :transactions, only: [:index], module: 'customers'

        collection do
          get :find, to: 'customers/finder#show'
          get :find_all, to: 'customers/finder#index'
          get :random, to: 'customers/random#show'
        end
      end

      get 'merchants/revenue', to: 'merchants/revenue#index'
      resources :merchants, only: [:index, :show] do

        get '/revenue', to: 'merchants/revenue#show'
        get '/most_revenue', to: 'merchants/revenue#index'
        get '/favorite_customer', to: 'merchants/customers#show'
        get '/customers_with_pending_invoices', to: 'merchants/customers#index'

        resources :items, only: [:index], module: 'merchants'
        resources :invoices, only: [:index], module: 'merchants'

        collection do
          get :find_all, to: 'merchants/finder#index'
          get :find, to: 'merchants/finder#show'
          get :random, to: 'merchants/random#show'
        end
      end

      resources :transactions, only: [:index, :show] do

        resources :invoice, only: [:index], module: 'transactions'

        collection do
          get :find, to: 'transactions/finder#show'
          get :find_all, to: 'transactions/finder#index'
          get :random, to: 'transactions/random#show'
        end
      end

      resources :invoices, only: [:index, :show] do

        resources :transactions, only: [:index], module: 'invoices'
        resources :invoice_items, only: [:index], module: 'invoices'
        resources :items, only: [:index], module: 'invoices'
        resources :merchant, only: [:index], module: 'invoices'
        resources :customer, only: [:index], module: 'invoices'

        collection do
          get :find, to: 'invoices/finder#show'
          get :find_all, to: 'invoices/finder#index'
          get :random, to: 'invoices/random#show'
        end
      end

      resources :invoice_items, only: [:index, :show] do

        resources :item, only: [:index], module: 'invoice_items'
        resources :invoice, only: [:index], module: 'invoice_items'

        collection do
          get :find, to: 'invoice_items/finder#show'
          get :find_all, to: 'invoice_items/finder#index'
          get :random, to: 'invoice_items/random#show'
        end
      end

      get 'items/most_revenue', to: 'items/revenue#index', module: 'items'
      resources :items, only: [:index, :show] do

        resources :invoice_items, only: [:index], module: 'items'
        resources :merchant, only: [:index], module: 'items'

        collection do
          get :find, to: 'items/finder#show'
          get :find_all, to: 'items/finder#index'
          get :random, to: 'items/random#show'
        end
      end

    end
  end
end
