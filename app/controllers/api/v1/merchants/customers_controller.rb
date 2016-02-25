class Api::V1::Merchants::CustomersController < Api::ApiController

  respond_to :json

  def show
    respond_with Merchant.favorite_customer(params)
  end

  def index
    respond_with Merchant.customers_with_pending_invoices(params)
  end

end
