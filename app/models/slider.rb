class Slider < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :active, :position, :image, :product_id
  mount_uploader :image, ImageUploader

  validates_presence_of :image

=======
  attr_accessible :active, :position,  :image, :product_id
  mount_uploader :image, ImageUploader

>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
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
