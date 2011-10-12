class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :phoebe_find, :boolean, :default => false
    add_column :products, :new_acquisition, :boolean, :default => false
  end
end
