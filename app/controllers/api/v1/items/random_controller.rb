class Api::V1::Items::RandomController < Api::ApiController

  respond_to :json
  
  def show
    offset = rand(Item.count)
    respond_with Item.offset(offset).first
  end

end
