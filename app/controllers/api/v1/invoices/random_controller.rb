class Api::V1::Invoices::RandomController < Api::ApiController

  respond_to :json
  
  def show
    offset = rand(Invoice.count)
    respond_with Invoice.offset(offset).first
  end

end
