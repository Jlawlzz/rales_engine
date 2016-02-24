class Api::V1::Merchants::RandomController < Api::ApiController

  def show
    offset = rand(Merchant.count)
    respond_with Merchant.offset(offset).first
  end

end
