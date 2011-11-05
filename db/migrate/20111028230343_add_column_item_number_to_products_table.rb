class AddColumnItemNumberToProductsTable < ActiveRecord::Migration
  def change
    add_column :products, :item_number, :integer
  end
end
