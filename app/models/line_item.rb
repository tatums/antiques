class LineItem < ActiveRecord::Base
  belongs_to :invoice
  #validates :invoice_id, :tax, :price, :presence => true

  before_save :init
  before_create :set_init_position
  after_save :trigger_invoice_save
  after_destroy :reset_position

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

  def reset_position
    invoice.line_items.each_with_index do |item, index|
      item.update_attributes(:position => index+1)
      #LineItem.where(:id => id.scan(/\d+/)).update_all(:position => index+1)

      #puts "Hello*********"
      #puts "ID: #{id}, INDEX: #{index}"
    end
    # invoice.line_items do |item|
    #   item.position = i
    #   i+=1
    # end
  end


  def sort
    params[:ProductsOrder].each_with_index do |id, index|
      Product.where(:id => id.scan(/\d+/)).update_all(:position => index+1)
    end
    render :nothing => true
  end


end
