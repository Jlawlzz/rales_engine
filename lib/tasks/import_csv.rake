desc "This task is called by the Heroku scheduler add-on"
task :import_csv => :environment do

  CsvImport.import_customers
  CsvImport.import_merchants
  CsvImport.import_invoices
  CsvImport.import_items
  CsvImport.import_transactions
  CsvImport.import_invoice_items

end
