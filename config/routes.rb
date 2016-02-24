Rails.application.routes.draw do

  namespace :api do

    namespace :v1, defaults: {format: :json} do

      resources :customers, only: [:index, :show] do

        resources :invoices, only: [:index], module: 'customers'
        resources :transactions, only: [:index], module: 'customers'

        collection do
          get :find, to: 'customers/finder#show', module: 'customers'
          get :find_all, to: 'customers/finder#index', module: 'customers'
          get :random, to: 'customers/random#show', module: 'customers'
        end
      end

      resources :merchants, only: [:index, :show] do

        get '/revenue', to: 'merchants/revenue#show', module: 'merchants'

        resources :items, only: [:index], module: 'merchants'
        resources :invoices, only: [:index], module: 'merchants'

        collection do
          get :find_all, to: 'merchants/finder#index', module: 'merchants'
          get :find, to: 'merchants/finder#show', module: 'merchants'
          get :random, to: 'merchants/random#show', module: 'merchants'
        end
      end

      resources :transactions, only: [:index, :show] do

        resources :invoice, only: [:index], module: 'transactions'

        collection do
          get :find, to: 'transactions/finder#show', module: 'transactions'
          get :find_all, to: 'transactions/finder#index', module: 'transactions'
          get :random, to: 'transactions/random#show', module: 'transactions'
        end
      end

      resources :invoices, only: [:index, :show] do

        resources :transactions, only: [:index], module: 'invoices'
        resources :invoice_items, only: [:index], module: 'invoices'
        resources :items, only: [:index], module: 'invoices'
        resources :merchant, only: [:index], module: 'invoices'
        resources :customer, only: [:index], module: 'invoices'

        collection do
          get :find, to: 'invoices/finder#show', module: 'invoices'
          get :find_all, to: 'invoices/finder#index', module: 'invoices'
          get :random, to: 'invoices/random#show', module: 'invoices'
        end
      end

      resources :invoice_items, only: [:index, :show] do

        resources :item, only: [:index], module: 'invoice_items'
        resources :invoice, only: [:index], module: 'invoice_items'

        collection do
          get :find, to: 'invoice_items/finder#show', module: 'invoice_items'
          get :find_all, to: 'invoice_items/finder#index', module: 'invoice_items'
          get :random, to: 'invoice_items/random#show', module: 'invoice_items'
        end
      end

      resources :items, only: [:index, :show] do

        resources :invoice_items, only: [:index], module: 'items'
        resources :merchant, only: [:index], module: 'items'

        collection do
          get :find, to: 'items/finder#show', module: 'items'
          get :find_all, to: 'items/finder#index', module: 'items'
          get :random, to: 'items/random#show', module: 'items'
        end
      end

    end
  end
end
