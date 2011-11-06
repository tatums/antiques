class AddColumnToSlider < ActiveRecord::Migration
  def change
    add_column :sliders, :product_id, :integer
  end
end
