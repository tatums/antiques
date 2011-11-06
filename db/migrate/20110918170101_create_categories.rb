class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.boolean :active, :default => false
      t.string :title
      t.text :description
      t.integer :position
      
      t.timestamps
    end
  end
end
