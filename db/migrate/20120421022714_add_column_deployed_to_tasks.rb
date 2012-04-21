class AddColumnDeployedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :deployed, :boolean, :default => false

  end
end
