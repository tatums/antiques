class ChangeSoldColumnInProductsTable < ActiveRecord::Migration
  def up
    prod_ids = []  #find sold products and store ids in arry
    products = Product.all
    products.each do |product|
      if product.sold?
        prod_ids << product.id
      end
    end

    remove_column :products, :sold
    add_column :products, :sold, :boolean, :default => false

    prod_ids.each do |id|  #set sold products as sold
      @product = Product.find(id)
      @product.update_attributes(:sold => true)
    end

    products = Product.where(:sold => nil)
    products.each do |product|
      product.update_attributes(:sold => false)
    end

  end

  def down
    remove_column :products, :sold
    add_column :products, :sold, :date
  end
end
