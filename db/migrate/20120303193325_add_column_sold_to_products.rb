class AddColumnSoldToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sold, :date

  end
end
