class SetActiveTrueAsDefaultInProducts < ActiveRecord::Migration
  def up
    change_column :products, :active, :boolean, :default => true
  end

  def down
    change_column :products, :active, :boolean
    
  end
end
