class Keyword < ActiveRecord::Base
  belongs_to :product, :touch => true
  after_save :create_associated_product_index
  after_destroy :destroy_associated_product_index
  
  validates :title, :presence => true
  
  
  private
  def create_associated_product_index
    product.index!
  end
  
  def destroy_associated_product_index
    product.index!
  end
  
end
