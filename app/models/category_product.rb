class CategoryProduct < ActiveRecord::Base
  belongs_to :category
  belongs_to :product

  after_create :set_init_position

  def set_init_position
    update_attributes(:position => 1)
    other_category_products = category.category_products.order(:position) - [self]
    other_category_products.to_enum.with_index(2) do |cp, index|
      cp.update_attributes(:position => index)
    end
  end

  scope :active, where('products.active' => true)

end
