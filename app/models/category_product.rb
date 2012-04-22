class CategoryProduct < ActiveRecord::Base
  belongs_to :category
  belongs_to :product

  after_create :set_init_position

  def set_init_position
    update_attributes(:position => 1)
    other_category_products = category.category_products - [self]
    other_category_products .each do |cp|
      cp.update_attributes(:position => cp.position+1)
    end
    # category_products = category.category_products
    # category_product = [] << self
    # update_attributes(:position => 1)
    # category_products -= category_product
    # category_products.to_enum.with_index(2) do |cp, index|
    #   cp.update_attributes(:position => index)
    # end
  end

  scope :active, where('products.active' => true)

end
