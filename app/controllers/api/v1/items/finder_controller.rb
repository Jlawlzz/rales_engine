class Api::V1::Items::FinderController < Api::ApiController

  respond_to :json

  def show
    respond_with Item.where(item_params).take
  end

  def index
    respond_with Item.where(item_params)
  end

  private

  def item_params
    params.permit(:id,
                  :name,
                  :description,
                  :unit_price,
                  :merchant_id,
                  :created_at,
                  :updated_at)
  end

end
