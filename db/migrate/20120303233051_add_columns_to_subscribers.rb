class AddColumnsToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :phone, :string
    add_column :subscribers, :notes, :text
  end
end
