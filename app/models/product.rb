class Product < ActiveRecord::Base
<<<<<<< HEAD
  has_many :images, :dependent => :destroy
  has_many :measurements, :dependent => :destroy
=======
  #has_and_belongs_to_many :categories
  #has_many :product_images
  has_many :images
  has_many :measurements
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
  has_many :sliders
 
  has_many :tags
  has_many :categories, :through => :tags

  validates_presence_of :title, :body, :image, :country, :period

<<<<<<< HEAD
  after_create :set_item_number

=======
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
 
  #attr_accessible :active, :title, :body, :new_acquisition, :phoebe_find, :country, :period, :image, :image_cache, :category_ids
  mount_uploader :image, ImageUploader

  

  def to_param  # overridden
    "#{id}-#{title.gsub(/\W/, '-').downcase}"
  end  


  scope :active, where(:active => true)

  scope :phoebe_finds, where(:phoebe_find => true)
  scope :new_acquisitions, where(:new_acquisition => true)



<<<<<<< HEAD
  def set_item_number
    if Product.all.empty?
      number = 1000
    else  
      number = Product.last.item_number
    end
    update_attributes(:item_number => number)
  end


=======
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6

end
