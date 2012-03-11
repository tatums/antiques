class CategoryProduct < ActiveRecord::Base
  belongs_to :category
  belongs_to :product

  after_create :set_init_position

  def set_init_position
    position = category.products.size
    update_attributes(:position => position)
  end

  scope :active, where('products.active' => true)

end
