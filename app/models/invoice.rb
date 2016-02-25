class Invoice < ActiveRecord::Base
  has_many :transactions
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :invoices

  scope :successfull, -> { joins(:transactions).where("result = 'success'") }
end
