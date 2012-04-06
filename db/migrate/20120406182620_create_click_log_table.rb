class CreateClickLogTable < ActiveRecord::Migration
  def change
    create_table :click_logs do |t|
      t.string :controller
      t.string :action
      t.string :description

      t.timestamps
    end
  end
end
