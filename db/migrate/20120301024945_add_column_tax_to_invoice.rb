class AddColumnTaxToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :tax, :decimal

  end
end
