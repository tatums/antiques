class AddAttributesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal, :precision => 8, :scale => 2
    add_column :products, :height, :integer
    add_column :products, :width, :integer
    add_column :products, :depth, :integer
    add_column :products, :diameter, :integer
  end
end
