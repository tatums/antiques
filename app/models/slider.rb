class Slider < ActiveRecord::Base
  belongs_to :product
  #attr_accessible :active, :position, :image, :image_cache, :product_id
  mount_uploader :image, ImageUploader
  #validates_presence_of :image
  scope :active, where(:active => true)
  scope :inactive, where(:active => false)

  def toggle_active
    if active == true
      update_attributes(:active => false)
    else
      update_attributes(:active => true)
    end
  end


end
