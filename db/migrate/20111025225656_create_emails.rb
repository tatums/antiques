class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :first
      t.string :last
      t.string :email

      t.timestamps
    end
  end
end
