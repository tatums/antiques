class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.integer :product_id

      t.timestamps
    end
  end
end
