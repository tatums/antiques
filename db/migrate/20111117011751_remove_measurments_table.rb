class RemoveMeasurmentsTable < ActiveRecord::Migration
  def up
    drop_table :measurements
  end

  def down
  end
end
