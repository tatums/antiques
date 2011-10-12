class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.integer :position
      t.string :dimension
      t.string :amount
      t.string :unit_of_measure
      t.integer :product_id

      t.timestamps
    end
  end
end
