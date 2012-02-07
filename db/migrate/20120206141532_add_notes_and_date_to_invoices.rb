class AddNotesAndDateToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :notes, :text
    add_column :invoices, :inv_date, :date
  end
end
