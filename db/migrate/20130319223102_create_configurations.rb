class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email
      t.boolean :current

      t.timestamps
    end
    Configuration.create( address1: '2222 N. Magnolia Avenue',
                          city: 'Chicago',
                          state: 'IL',
                          zip: '60614',
                          email: 'admin@phoebeboothantiques.com',
                          current: true,
                          phone: '917-597-4368')
  end
end
