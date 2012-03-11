class RenameSubscribersTableToContacts < ActiveRecord::Migration
  def up
    rename_table :subscribers, :contacts
  end

  def down
    rename_table :subscribers, :contacts
  end
end
