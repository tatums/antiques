class AddColumnShippingToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :shipping, :decimal, :precision => 8, :scale => 2

  end
end
