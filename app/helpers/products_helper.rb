module ProductsHelper
  def full_dimensions(product)
    data = product.measurements.order_by_position.collect { |d| d.full_line }.join( '<span> x </span>' )
    return data.html_safe
  end
  
  def country_and_period(product)
    unless product.country.nil? or product.period.nil?
       product.country + " | " + product.period
    end
  end
  
  def read_more(product)
      desc = product.body
      preview_words = 35
      total_words = desc.split.length
      if total_words < preview_words
        preview = desc          
      else
        preview = desc.split[0..preview_words].join(" ")+" ... "
      end
    return preview.html_safe
  end  
  
  
end
