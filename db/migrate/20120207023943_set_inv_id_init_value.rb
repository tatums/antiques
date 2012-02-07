class SetInvIdInitValue < ActiveRecord::Migration
  def up
    1..997.times do
      Invoice.create(:title => "Stuff")
    end

    1..997.times do
      Invoice.last.destroy
    end
  end

  def down
  end
end
