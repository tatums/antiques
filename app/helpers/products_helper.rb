module ProductsHelper

  
  def country_and_period(product)
    unless product.country.nil? or product.period.nil?
       product.country + ", " + product.period
    end
  end
  

  def read_more(product)
      desc = product.body
      preview_words = 35
      total_words = desc.split.length
      if total_words < preview_words
        preview = desc          
      else
        preview = desc.split[0..preview_words].join(" ")+" ..."
      end
      data = "<p id='product-desc'>"+preview +"</p>"
    return data.html_safe
  end  

  def read_more_setup_as_paragraphs(product)
    output = []
    paragraphs = product.body.split("\r\n")
    paragraphs.each do |paragraph|
      unless paragraph.empty?
        output << "<p>" + paragraph.to_s + "</p>"
      end
    end
    x = output.join
      preview_words = 35
      total_words = x.split(" ").length
      if total_words < preview_words
        preview = x          
      else
        preview = x.split[0..preview_words].join(" ")+ "#{link_to " ...more", product, :class=> 'more'}" 
      end
      data = "<li>"+preview +"</li>"
    return data.html_safe   
  end


  def setup_paragraphs(product)
    output = []
    paragraphs = product.body.split("\r\n")
    paragraphs.each do |paragraph|
      unless paragraph.empty?
        output << "<p>" + paragraph.to_s + "</p>"
      end
    end
    return "<li>" + output.join + "</li>"
  end

  def formatted_price(price)
    unless price.nil?
      "<li>" + number_to_currency(price, :precision => 0) + "</li>"
    end
  end
  def formatted_dimensions(product)
    output = ""
    if product.measurements_setup?
      if product.diameter.nil?
        output = "<li>H " + product.height.to_s + "\" x W " + product.width.to_s + "\" x D " + product.depth.to_s + "\" </li>"
      else
        output = "<li>H " + product.height.to_s + "\" x Dia " + product.diameter.to_s +  "\" </li>"
      end
    end  
    return output
  end
  
end
