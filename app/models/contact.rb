class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :comments
  #validates_uniqueness_of :name
end
