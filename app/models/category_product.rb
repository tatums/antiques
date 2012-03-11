class CategoryProduct < ActiveRecord::Base
  belongs_to :category
  belongs_to :product

  after_create :set_init_position

  def set_init_position
    position = category.products.size
    #position = category.categories_products.size
    update_attributes(:position => position)
  end

  # def set_init_position
  #   position = category.tags.size
  #   update_attributes(:position => position)
  # end

  scope :active2, where('products.active' => true)

end
