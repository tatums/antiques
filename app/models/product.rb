class Product < ActiveRecord::Base
  #has_and_belongs_to_many :categories
  #has_many :product_images
  has_many :images
  has_many :measurements
  has_many :sliders
 
  has_many :tags
  has_many :categories, :through => :tags

  validates_presence_of :title, :body, :image, :country, :period

 
  #attr_accessible :active, :title, :body, :new_acquisition, :phoebe_find, :country, :period, :image, :image_cache, :category_ids
  mount_uploader :image, ImageUploader

  

  def to_param  # overridden
    "#{id}-#{title.gsub(/\W/, '-').downcase}"
  end  


  scope :active, where(:active => true)

  scope :phoebe_finds, where(:phoebe_find => true)
  scope :new_acquisitions, where(:new_acquisition => true)




end
