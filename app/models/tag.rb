class Tag < ActiveRecord::Base
  belongs_to :category
  belongs_to :product

  after_create :set_init_position

  def set_init_position
    position = category.tags.size
    update_attributes(:position => position)
  end

end
