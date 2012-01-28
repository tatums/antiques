class Invoice < ActiveRecord::Base
  belongs_to :subscriber
  after_initialize :init

  def init
    self.grand_total  ||= 0.0       #will set the default value only if it's nil
  end
end
