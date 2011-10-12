class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.boolean :active, :default => true
      t.string :image

      t.timestamps
    end
  end
end
