class Api::V1::ItemsController < Api::ApiController

  respond_to :json

  def index
    find_all
  end

  def show
    find
  end

  private

  def find
    if params[:id]
      respond_with Item.find(params[:id])
    elsif params[:name]
      respond_with Item.find_by('LOWER(name) = ?', params[:name].downcase)
    elsif params[:description]
      respond_with Item.find_by('LOWER(description) = ?', params[:description].downcase)
    elsif params[:unit_price]
      respond_with Item.find_by(unit_price: (params[:unit_price].to_f * 100).to_i)
    elsif params[:merchant_id]
      respond_with Item.find_by(merchant_id: params[:merchant_id])
    elsif params[:created_at]
      respond_with Item.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Item.find_by(updated_at: params[:updated_at])
    else
      offset = rand(Item.count)
      respond_with Item.offset(offset).first
    end
  end

  def find_all
    if params[:id]
      respond_with Item.where(id: params[:id])
    elsif params[:name]
      respond_with Item.where('LOWER(name) = ?', params[:name].downcase)
    elsif params[:description]
      respond_with Item.where('LOWER(description) = ?', params[:description].downcase)
    elsif params[:unit_price]
      respond_with Item.where(unit_price: (params[:unit_price].to_f * 100).to_i)
    elsif params[:merchant_id]
      respond_with Item.where(merchant_id: params[:merchant_id])
    elsif params[:created_at]
      respond_with Item.where(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Item.where(updated_at: params[:updated_at])
    else
      respond_with Item.all
    end
  end

end
