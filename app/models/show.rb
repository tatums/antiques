class Show < ActiveRecord::Base
  scope :active, where(:active => true)
  
end
