class Api::V1::Customers::FindController < Api::ApiController

  def show
    offset = rand(Customer.count)
    respond_with Customer.offset(offset).first
  end

end
