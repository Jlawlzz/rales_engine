class Api::V1::Invoices::CustomerController < Api::ApiController

  respond_to :json

  def index
    respond_with Customer.find(Invoice.find(params[:invoice_id]).customer.id)
  end

end
