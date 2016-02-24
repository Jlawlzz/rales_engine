require 'CSV'

class CsvImport < ActiveRecord::Base

  def self.import_customers
    file = "vendor/assets/csv/customers.csv"
    CSV.foreach(file, :headers => true) do |row|
      Customer.create!(row.to_h)
    end
  end

  def self.import_merchants
    file = "vendor/assets/csv/merchants.csv"
    CSV.foreach(file, :headers => true) do |row|
      Merchant.create!(row.to_h)
    end
  end

  def self.import_invoices
    file = "vendor/assets/csv/invoices.csv"
    CSV.foreach(file, :headers => true) do |row|
      Invoice.create!(row.to_h)
    end
  end

  def self.import_transactions
    file = "vendor/assets/csv/transactions.csv"
    CSV.foreach(file, :headers => true) do |row|
      Transaction.create!(row.to_h)
    end
  end

  def self.import_items
    file = "vendor/assets/csv/items.csv"
    CSV.foreach(file, :headers => true) do |row|
      Item.create!(name: row['name'],
                   description: row['description'],
                   merchant_id: row['merchant_id'],
                   unit_price: (row['unit_price'].to_f/100).to_s,
                   created_at: row['created_at'],
                   updated_at: row['updated_at'])
    end
  end

  def self.import_invoice_items
    file = "vendor/assets/csv/invoice_items.csv"
    CSV.foreach(file, :headers => true) do |row|
      InvoiceItem.create!(item_id: row['item_id'],
                          invoice_id: row['invoice_id'],
                          quantity: row['quantity'],
                          unit_price: (row['unit_price'].to_f/100).to_s,
                          created_at: row['created_at'],
                          updated_at: row['updated_at'])
    end
  end


end
