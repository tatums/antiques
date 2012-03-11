class ChangeForeignKeyInInvoices < ActiveRecord::Migration
  def up
    rename_column :invoices, :subscriber_id, :contact_id
  end

  def down
    rename_column :invoices, :contact_id, :subscriber_id

  end
end
