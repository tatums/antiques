class RenameInvoiceNumberAndChangeDataType < ActiveRecord::Migration
  def up
    rename_column :invoices, :invoice_number, :inv_number
    change_column :invoices, :inv_number, :string
  end

  def down
    change_column :invoices, :inv_number, :integer
    rename_column :invoices, :inv_number, :invoice_number
  end
end
