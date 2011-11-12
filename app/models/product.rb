class Product < ActiveRecord::Base

  has_many :images, :dependent => :destroy
  has_many :measurements, :dependent => :destroy
  has_many :sliders
 
  has_many :tags
  has_many :categories, :through => :tags

  before_create :set_item_number
  #after_initialize :set_item_number

  validates_presence_of :title, :body,  :country, :period, :image
 
  #attr_accessible :active, :title, :body, :new_acquisition, :phoebe_find, :country, :period, :image, :image_cache, :category_ids
  mount_uploader :image, ImageUploader

  def to_param  # overridden
    "#{id}-#{title.gsub(/\W/, '-').downcase}"
  end  

  scope :active, where(:active => true)
  scope :phoebe_finds, where(:phoebe_find => true)
  scope :new_acquisitions, where(:new_acquisition => true)

  searchable do
      text :title, :body
  end

protected
  def set_item_number
    Product.last ? number = Product.last.item_number : number = 1000
    number += 1
    self.item_number = number
  end



end
