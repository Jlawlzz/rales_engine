require 'CSV'

desc "This task is called by the Heroku scheduler add-on"
task :import_csv => :environment do

    file = "vendor/assets/csv/customers.csv"
    CSV.foreach(file, :headers => true) do |row|
      Customer.create!(row.to_h)
    end

    file = "vendor/assets/csv/merchants.csv"
    CSV.foreach(file, :headers => true) do |row|
      Merchant.create!(row.to_h)
    end

    file = "vendor/assets/csv/invoices.csv"
    CSV.foreach(file, :headers => true) do |row|
      Invoice.create!(row.to_h)
    end

    file = "vendor/assets/csv/transactions.csv"
    CSV.foreach(file, :headers => true) do |row|
      Transaction.create!(row.to_h)
    end

    file = "vendor/assets/csv/items.csv"
    CSV.foreach(file, :headers => true) do |row|
      Item.create!(row.to_h)
      price = Item.last.unit_price
      Item.last.update(unit_price: price.insert(-3, '.'))
      Item.last.update(updated_at: row['updated_at'])
    end

    file = "vendor/assets/csv/invoice_items.csv"
    CSV.foreach(file, :headers => true) do |row|
      InvoiceItem.create!(row.to_h)
      price = InvoiceItem.last.unit_price
      InvoiceItem.last.update(unit_price: (price/100))
      InvoiceItem.last.update(updated_at: row['updated_at'])
    end
  end
