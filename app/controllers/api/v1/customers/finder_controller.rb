class Api::V1::Customers::FinderController < Api::ApiController

  respond_to :json

  def show
    respond_with Customer.where(customer_params).take
  end

  def index
    respond_with Customer.where(customer_params)
  end

  private

  def customer_params
    params.permit(:id,
                  :first_name,
                  :last_name,
                  :created_at,
                  :updated_at)
  end

end
