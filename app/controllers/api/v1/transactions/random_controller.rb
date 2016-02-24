class Api::V1::Transactions::RandomController < Api::ApiController

  def show
    offset = rand(Transaction.count)
    respond_with Transaction.offset(offset).first
  end

end
