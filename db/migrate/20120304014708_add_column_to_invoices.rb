class AddColumnToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :price_header, :string
  end
end
