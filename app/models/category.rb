class Category < ActiveRecord::Base
  has_many :category_products
  has_many :products, :through => :category_products

  before_save :set_slug, :downcase_title
  after_create :set_init_position
  before_destroy :protect_sold

  validates_presence_of :title
  validates_uniqueness_of :title

  scope :active, where(:active => true)
  scope :inactive, where(:active => false)

  def set_init_position
    update_attributes(:position => Category.all.size)
  end


  def to_param  # overridden
    slug
  end

  def toggle_active
    if active == true
      update_attributes(:active => false)
    else
      update_attributes(:active => true)
    end
  end


private
  def set_slug
    self.slug = self.title.gsub(' ', '-').gsub(/[^a-zA-Z0-9\_\-\.]/, '').downcase
  end

  def downcase_title
    self.title = self.title.downcase
  end

  def protect_sold
    self.errors[:base] << "Sorry. You can NOT delete the Sold category" and return false if title == 'sold'
  end

end
