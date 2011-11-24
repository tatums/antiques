class RemoveWidthHeightDepthReplaceWithDimensions < ActiveRecord::Migration
  def up
    remove_column :products, :width
    remove_column :products, :height
    remove_column :products, :depth
    remove_column :products, :diameter
    add_column :products, :dimensions, :string
  end

  def down
    add_column :products, :width, :integer
    add_column :products, :height, :integer
    add_column :products, :depth, :integer
    add_column :products, :diameter, :integer
    remove_column :products, :dimensions, :string
  end
end
