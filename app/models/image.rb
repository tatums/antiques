class Image < ActiveRecord::Base
  validates_presence_of :image
  attr_accessible :image

  belongs_to :product
  mount_uploader :image, ImageUploader

end
