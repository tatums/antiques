class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.boolean :active
      t.string :title
      t.string :url
      t.string :dates

      t.timestamps
    end
  end
end
