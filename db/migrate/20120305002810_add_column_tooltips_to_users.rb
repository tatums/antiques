class AddColumnTooltipsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :show_tooltips, :boolean

  end
end
