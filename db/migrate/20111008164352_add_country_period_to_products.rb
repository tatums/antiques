class AddCountryPeriodToProducts < ActiveRecord::Migration
  def change
    add_column :products, :country, :string
    add_column :products, :period, :string
  end
end
