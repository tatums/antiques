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
    output = ""
    unless price.blank?
      output = "<li>" + number_to_currency(price, :precision => 0) + "</li>"
    end
    return output.html_safe
  end

  def formatted_dimensions(dimensions)
    output = ""
    unless dimensions.blank?
      output = "<li>" + dimensions + "</li>"
    end
    return output.html_safe
  end

  def sold?(active)
      "<span class='sold'> </span>".html_safe if active == false
  end

  def edit_button_if_logged_in(product)
    if current_user
      link_to 'Edit', edit_product_path(product), :class => "products-edit-button nice small white radius button no-print"
    end
  end

  def upload_images_button_if_logged_in(product)
    if current_user
      link_to 'Upload Images', product, :class => "products-upload-button nice small white radius button no-print"
    end
  end

  def invoice_button_if_logged_in(product)
    if current_user
      link_to 'Invoice', invoice_product_setup_path(Invoice, product), :class => "products-upload-button nice small white radius button no-print"
    end
  end

end
