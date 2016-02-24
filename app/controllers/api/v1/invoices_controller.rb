class Api::V1::InvoicesController < Api::ApiController

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
      respond_with Invoice.find(params[:id])
    elsif params[:status]
      respond_with Invoice.find_by('LOWER(status) = ?', params[:status].downcase)
    elsif params[:customer_id]
      respond_with Invoice.find_by(customer_id: params[:customer_id])
    elsif params[:merchant_id]
      respond_with Invoice.find_by(merchant_id: params[:merchant_id])
    elsif params[:created_at]
      respond_with Invoice.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Invoice.find_by(updated_at: params[:updated_at])
    else
      offset = rand(Invoice.count)
      respond_with Invoice.offset(offset).first
    end
  end

  def find_all
    if params[:id]
      respond_with Invoice.where(id: params[:id])
    elsif params[:status]
      respond_with Invoice.where('LOWER(status) = ?', params[:status].downcase)
    elsif params[:customer_id]
      respond_with Invoice.where(customer_id: params[:customer_id])
    elsif params[:merchant_id]
      respond_with Invoice.where(merchant_id: params[:merchant_id])
    elsif params[:created_at]
      respond_with Invoice.where(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Invoice.where(updated_at: params[:updated_at])
    else
      respond_with Invoice.all
    end
  end

end
