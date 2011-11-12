class DropProductImagesTable < ActiveRecord::Migration
  def up
    drop_table :product_images
  end

  def down
  end
end
