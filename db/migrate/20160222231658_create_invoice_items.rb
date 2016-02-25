class CreateInvoiceItems < ActiveRecord::Migration
  def change
    enable_extension("citext")

    create_table :invoice_items do |t|
      t.references :item, index: true, foreign_key: true
      t.references :invoice, index: true, foreign_key: true
      t.decimal :unit_price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
