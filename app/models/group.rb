class Group < ActiveRecord::Base
  validate :title, :presence => true

  has_many :contact_groups, :dependent => :delete_all
  has_many :contacts, :through => :contact_groups

end
