class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.boolean :active
      t.string :title
      t.text :body
      t.string :image
      t.integer :position

      t.timestamps
    end
  end
end
