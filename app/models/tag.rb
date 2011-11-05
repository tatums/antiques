class Tag < ActiveRecord::Base
  belongs_to :category
  belongs_to :product
<<<<<<< HEAD
  after_create :set_init_position


  def set_init_position
    position = category.tags.size
    update_attributes(:position => position)
  end

=======
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6

end
