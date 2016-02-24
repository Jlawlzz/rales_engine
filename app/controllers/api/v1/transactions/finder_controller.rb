class Api::V1::Transactions::FinderController < Api::ApiController

  respond_to :json

  def show
    respond_with Transaction.where(transaction_params).take
  end

  def index
    respond_with Transaction.where(transaction_params)
  end

  private

  def transaction_params
    params.permit(:id,
                  :invoice_id,
                  :credit_card_number,
                  :credit_card_expiration_date,
                  :result,
                  :created_at,
                  :updated_at)
  end

end
