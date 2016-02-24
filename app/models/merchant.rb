class Merchant < ActiveRecord::Base
  has_many :item

  def self.gross_revenue_by_merchant(params)
    cost_collection = InvoiceItem.joins(invoice: :transactions).where(transactions: {result: 'success'}).where(invoices: {merchant_id: params[:merchant_id]}).pluck(:quantity, :unit_price)
    {revenue: ((cost_collection.map {|q, n| q * n}).reduce(:+))}
  end

  def self.gross_revenue_by_merchant_by_date(params)
    cost_collection = InvoiceItem.joins(invoice: :transactions).where(transactions: {result: 'success'}).where(invoices: {merchant_id: params[:merchant_id], created_at: params['date']}).pluck(:quantity, :unit_price)
    {revenue: ((cost_collection.map {|q, n| q * n}).reduce(:+))}
  end
end
