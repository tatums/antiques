class Invoice < ActiveRecord::Base
  belongs_to :subscriber
  has_many :line_items

  def calc_sub_total
    line_items.map(&:total).sum
  end

  def calc_total_tax
    line_items.map(&:tax).sum
  end

  def calc_grand_total
    calc_sub_total + calc_total_tax
  end
  def calc_shipping_total
      0   #||= 0
  end

end
