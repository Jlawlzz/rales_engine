class Merchant < ActiveRecord::Base
  has_many :item
  has_many :invoices

  def self.gross_revenue_by_merchant(params)
    cost_collection = InvoiceItem.joins(invoice: :transactions)
                                 .where(transactions: {result: 'success'})
                                 .where(invoices: {merchant_id: params[:merchant_id]})
                                 .pluck(:quantity, :unit_price)
    {revenue: ((cost_collection.map {|q, n| q * n}).reduce(:+))}
  end

  def self.gross_revenue_by_merchant_by_date(params)
    cost_collection = InvoiceItem.joins(invoice: :transactions)
                                 .where(transactions: {result: 'success'})
                                 .where(invoices: {merchant_id: params[:merchant_id], created_at: params['date']})
                                 .pluck(:quantity, :unit_price)
    {revenue: ((cost_collection.map {|q, n| q * n}).reduce(:+))}
  end

  def self.favorite_customer(params)
    merchant = Merchant.find(params[:merchant_id]).invoices
                       .joins(:transactions)
                       .where(transactions: {result: 'success'})
                       .joins(:customer).group(:customer)
                       .order(count: :desc)
                       .count.first.first
    merchant
  end

  def self.customers_with_pending_invoices(params)
    customer = Customer.joins(invoices: :transactions)
                       .where(invoices: {merchant_id: params[:merchant_id]})
                       .where(transactions: {result: 'failed'}).uniq
    customer
  end

  def self.revenue_per_date_all_merchants(params)
    cost_collection = InvoiceItem.joins(invoice: :transactions)
                                 .where(transactions: {result: 'success'})
                                 .where(invoices: {created_at: params['date']})
                                 .pluck(:quantity, :unit_price)
    {total_revenue: ((cost_collection.map {|q, n| q * n}).reduce(:+))}
  end
end
