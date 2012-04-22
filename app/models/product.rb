class Product < ActiveRecord::Base
  before_save :strip_whitespace_from_title
  before_create :set_item_number
  after_create :set_init_position

  has_many :images, :dependent => :destroy
  has_many :sliders
  has_many :keywords, :dependent => :destroy

  has_many :category_products
  has_many :categories, :through => :category_products


  validates_presence_of :title#, :body,  :country, :period#, :image
  #attr_accessible :active, :sold, :title, :body, :new_acquisition, :phoebe_find, :country, :period, :image, :image_cache, :category_ids
  mount_uploader :image, ImageUploader

  def to_param  # overridden
    "#{id}-#{title.gsub(/\W/, '-').downcase}"
  end

  scope :active, where(:active => true)
  scope :inactive, where(:active => false)
  scope :phoebe_finds, where(:phoebe_find => true)

  def self.not_sold
    Product.where(:sold => false)
  end

  searchable :auto_index => true, :auto_remove => true do
    text :title, :body, :item_number
    text :keywords do
      keywords.map(&:title)
    end
  end

  def measurements_setup?
    unless height.nil? && width.nil? && depth.nil? && diameter.nil?
       return true
    end
  end

  def set_as_sold_and_move_to_sold_category
    update_attributes(:sold => true)
    category_products.destroy_all
    Category.find_or_create_by_title('sold', :active => true).products << self
  end


protected
  def strip_whitespace_from_title
    title.strip!
  end

  def set_item_number
    Product.last ? number = Product.last.item_number : number = 1000
    number += 1
    self.item_number = number
  end

  def set_init_position
    update_attributes(:position => 1)
    other_products = Product.order(:position) - [self]
    other_products.to_enum.with_index(2) do |product, index|
      product.update_attributes(:position => index)
    end


  end


end
