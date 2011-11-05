class Slider < ActiveRecord::Base

  attr_accessible :active, :position, :image, :product_id
  mount_uploader :image, ImageUploader

  validates_presence_of :image

  scope :active, where(:active => true)
  scope :inactive, where(:active => false)

  belongs_to :product



  def toggle_active
    if active == true
      update_attributes(:active => false)
    else
      update_attributes(:active => true)
    end  
  end


end
