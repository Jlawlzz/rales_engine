class Api::V1::Merchants::ItemController < Api::ApiController

  respond_to :json

  def index
    respond_with Item.find(params[:item_id])
  end

end
