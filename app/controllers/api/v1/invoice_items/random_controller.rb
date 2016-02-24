class Api::V1::InvoiceItems::RandomController < Api::ApiController

  def show
    offset = rand(InvoiceItems.count)
    respond_with InvoiceItems.offset(offset).first
  end

end
