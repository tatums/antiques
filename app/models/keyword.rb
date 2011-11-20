class Keyword < ActiveRecord::Base
  belongs_to :product
  validate :title, :presence => true
end
