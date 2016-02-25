class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.favorite_merchant(params)
    Customer.find(params[:customer_id]).invoices
                                       .joins(:transactions)
                                       .where(transactions: {result: 'success'})
                                       .group(:merchant)
                                       .order(count: :desc)
                                       .count.first.first

  end
end
