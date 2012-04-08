class ContactGroup < ActiveRecord::Base
  belongs_to :contact
  belongs_to :group
  validates_uniqueness_of :contact_id, :scope => :group_id
end
