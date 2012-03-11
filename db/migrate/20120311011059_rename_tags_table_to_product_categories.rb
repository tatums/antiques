class RenameTagsTableToProductCategories < ActiveRecord::Migration
  def up
    rename_table :tags, :category_products
  end

  def down
    rename_table :category_products, :tags
  end
end
