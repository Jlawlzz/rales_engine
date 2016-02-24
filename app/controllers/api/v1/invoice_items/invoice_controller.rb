class Api::V1::InvoiceItems::InvoiceController < Api::ApiController

  respond_to :json

  def index
    respond_with Invoice.find(params[:invoice_id])
  end

end
