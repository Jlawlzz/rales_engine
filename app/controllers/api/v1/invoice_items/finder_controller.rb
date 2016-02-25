class Api::V1::InvoiceItems::FinderController < Api::ApiController

  respond_to :json

  def show
    respond_with InvoiceItem.where(invoice_items_params).first
  end

  def index
    respond_with InvoiceItem.where(invoice_items_params)
  end

  private

  def invoice_items_params
    params.permit(:id,
                  :item_id,
                  :invoice_id,
                  :quantity,
                  :unit_price,
                  :created_at,
                  :updated_at)
  end

end
