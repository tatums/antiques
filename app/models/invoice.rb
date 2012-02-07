class Invoice < ActiveRecord::Base
  belongs_to :subscriber
  has_many :line_items
  # before_create :set_invoice_number

  def calc_sub_total
    line_items.map(&:total).sum
  end

  def calc_tax_total
    line_items.map(&:tax).sum
  end

  def calc_grand_total
    calc_sub_total + calc_tax_total
  end

  def calc_shipping_total
      0   #||= 0
  end

# protected
#   def set_invoice_number
#     Invoice.last ? number = Invoice.last.invoice_number : number = 1000
#     number += 1
#     self.invoice_number = number
#   end



end
