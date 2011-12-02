class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :completed
      t.string :title

      t.timestamps
    end
  end
end
