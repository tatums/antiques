class Invoice < ActiveRecord::Base
  belongs_to :contact
  has_many :line_items
  has_many :notes, :as => :notable

  before_save :init
  before_create :set_inv_date
  after_create :set_inv_number

  validate :inv_date, :presence => true

  paginates_per 10

  def init
    self.tax ||= 0.0
    self.shipping ||= 0.0
    self.price_header ||= "Price"
  end

  def calc_sub_total
    line_items.map(&:total).sum
  end

  def calc_tax_total
    self.tax ||= 0.0
  end

  def calc_grand_total
    calc_sub_total + calc_tax_total
  end

  def calc_shipping_total
      0
  end

  def setup_line_item_from(product)
    line_items.build( product_id: product.id,
                      item_number: product.item_number,
                      description: product.title,
                      price: product.price,
                      quantity: 1,
                      dimensions: product.dimensions)
  end

protected

  def set_inv_number #set the inv number to the date + inv count for current day
    inv_count = Invoice.select(:id).where(:created_at => (Date.today.to_datetime)..(Date.today.to_datetime+(1.day-1.second))).size
    number = Time.now.to_date.strftime('%m%d%y') + inv_count.to_s
    self.update_attributes(:inv_number => number)
  end

  def set_inv_date
    self.inv_date = Time.now.to_date if self.inv_date.nil?
  end

end
