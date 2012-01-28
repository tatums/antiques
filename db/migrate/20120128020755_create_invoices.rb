class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :title
      t.decimal :subtotal
      t.decimal :grand_total
      t.decimal :tax
      t.integer :subscriber_id

      t.timestamps
    end
  end
end
