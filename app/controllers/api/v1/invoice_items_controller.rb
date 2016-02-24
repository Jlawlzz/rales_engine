class Api::V1::InvoiceItemsController < Api::ApiController

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
      respond_with InvoiceItem.find(params[:id])
    elsif params[:item_id]
      respond_with InvoiceItem.find_by(item_id: params[:item_id])
    elsif params[:invoice_id]
      respond_with InvoiceItem.find_by(invoice_id: params[:invoice_id])
    elsif params[:quantity]
      respond_with InvoiceItem.find_by(quantity: params[:quantity])
    elsif params[:unit_price]
      respond_with InvoiceItem.find_by(unit_price: (params[:unit_price].to_f * 100).to_i)
    elsif params[:created_at]
      respond_with InvoiceItem.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with InvoiceItem.find_by(updated_at: params[:updated_at])
    else
      offset = rand(InvoiceItem.count)
      respond_with InvoiceItem.offset(offset).first
    end
  end

  def find_all
    if params[:id]
      respond_with InvoiceItem.where(id: params[:id])
    elsif params[:item_id]
      respond_with InvoiceItem.where(item_id: params[:item_id])
    elsif params[:invoice_id]
      respond_with InvoiceItem.where(invoice_id: params[:invoice_id])
    elsif params[:quantity]
      respond_with InvoiceItem.where(quantity: params[:quantity])
    elsif params[:unit_price]
      respond_with InvoiceItem.where(unit_price: (params[:unit_price].to_f * 100).to_i)
    elsif params[:created_at]
      respond_with InvoiceItem.where(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with InvoiceItem.where(updated_at: params[:updated_at])
    else
      respond_with InvoiceItem.all
    end
  end

end
