class Slider < ActiveRecord::Base
  belongs_to :product

  attr_accessible :active, :title, :position, :image, :image_cache, :product_id

  mount_uploader :image, ImageUploader
  scope :active, where(:active => true)
  scope :inactive, where(:active => false)

  before_save :default_title

  def toggle_active
    if active == true
      update_attributes(:active => false)
    else
      update_attributes(:active => true)
    end
  end

  private
  def default_title
    self.title ||= 'Phoebe Booth Antiques'
  end

end
