class Api::V1::Customers::TransactionsController < Api::ApiController

  respond_to :json

  def index
    respond_with Customer.find(params[:customer_id]).transactions
  end

end
