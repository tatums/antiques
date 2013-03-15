class Keyword < ActiveRecord::Base
  belongs_to :product, :touch => true
  validates :title, :presence => true
end
