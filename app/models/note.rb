class Note < ActiveRecord::Base
  attr_accessible :body, :notable_id, :notable_type

  belongs_to :notable, :polymorphic => true

end
