class Invoice < ActiveRecord::Base
  belongs_to :subscriber
  has_many :line_items

  after_initialize :init
  before_save :sum_totals

  def init #will set the default value only if it's nil
    self.grand_total  ||= 0.0
    self.tax  ||= 0.0
    self.subtotal  ||= 0.0
  end

  def calc_sub_total
    line_items.map(&:price).sum
  end

  def calc_total_tax
    line_items.map(&:tax).sum
  end

  def calc_grand_total
    subtotal + tax
  end

protected

  def sum_totals
    self.tax = line_items.map(&:tax).sum
    self.subtotal = line_items.map(&:price).sum
  end

end
