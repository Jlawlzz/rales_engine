class Api::V1::Items::RandomController < Api::ApiController

  def show
    offset = rand(Item.count)
    respond_with Item.offset(offset).first
  end

end
