class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :position
      t.integer :product_id
      t.string :item_number
      t.string :description
      t.string :dimensions
      t.integer :quantity
      t.decimal :price
      t.decimal :tax
      t.decimal :total
      t.integer :invoice_id

      t.timestamps
    end
  end
end
