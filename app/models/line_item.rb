class LineItem < ActiveRecord::Base
  belongs_to :invoice

  before_save :init
  before_create :set_init_position
  after_save :trigger_invoice_save, :init
  after_destroy :reset_position

  def init #will set the default value only if it's nil
    self.price ||= 0.0
    self.tax ||= 0.0
    self.quantity ||= 0
    self.total = (quantity * price) + tax
  end

protected

  def set_init_position
    self.position = invoice.line_items.size + 1
  end

  def trigger_invoice_save
    invoice.save
  end

  def reset_position
    invoice.line_items.each_with_index do |item, index|
      item.update_attributes(:position => index+1)
    end
  end

  def sort
    generic_sort(params[:ProductsOrder], 'Product')
    render :nothing => true
  end

end
