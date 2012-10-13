class RenameNotesField < ActiveRecord::Migration
  def up
    rename_column :contacts, :notes, :note
  end

  def down
    rename_column :contacts, :note, :notes
  end
end
