class Category < ActiveRecord::Base
  
  #has_and_belongs_to_many :products
  has_many :tags
  has_many :products, :through => :tags
  
  validates_presence_of :title, :description
  validates_uniqueness_of :title
  
  scope :active, where(:active => true)
  scope :inactive, where(:active => false)


  after_create :set_init_position

  def set_init_position
    update_attributes(:position => Category.all.size)
  end

  before_save :set_slug, :downcase_title

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
  
end
