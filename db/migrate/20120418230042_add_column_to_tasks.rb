class AddColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :description, :text
    add_column :tasks, :position, :integer
  end
end
