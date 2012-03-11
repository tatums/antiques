class Group < ActiveRecord::Base
  validate :title, :presence => true

  has_many :contact_groups
  has_many :contacts, :through => :contact_groups

end
