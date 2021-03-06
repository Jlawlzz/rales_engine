class Api::V1::Merchants::RevenueController < Api::ApiController

  respond_to :json

  def show
    if params[:date]
      respond_with Merchant.gross_revenue_by_merchant_by_date(params)
    else
      respond_with Merchant.gross_revenue_by_merchant(params)
    end
  end

  def index
    respond_with Merchant.revenue_per_date_all_merchants(params)
  end

end
