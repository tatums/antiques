class Group < ActiveRecord::Base
  validate :title, :presence => true

  has_many :contact_groups, :dependent => :delete_all
  has_many :contacts, :through => :contact_groups

  validates_associated :contact_groups

  scope :excluding_ids, lambda { |ids|
    where(['id NOT IN (?)', ids]) if ids.any?
  }

end
