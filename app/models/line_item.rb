class LineItem < ActiveRecord::Base
  belongs_to :invoice
  #validates :invoice_id, :tax, :price, :presence => true

  #after_initialize :init
  before_save :init
  before_create :set_init_position#, :trigger_invoice_save
  after_save :trigger_invoice_save

  def init #will set the default value only if it's nil
    self.price ||= 0.0
    self.tax ||= 0.0
    self.quantity ||= 0
    self.total ||= (quantity * price) + tax
  end

protected
  def set_init_position
    self.position = invoice.line_items.size + 1
  end

  def trigger_invoice_save
    invoice.save
  end


end
