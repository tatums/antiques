module ProductsHelper

  def country_and_period(product)
    output = []
    output << product.country unless product.country.blank?
    output << product.period unless product.period.blank?
    output.join(', ')
  end

  def read_more_setup_as_paragraphs(product)
    if product.body.nil?
      data = ""
    else
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
    end
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

  def formatted_price(product)
    content_tag :li, number_to_currency(product.price, :precision => 0) unless product.price.blank?
  end

  def formatted_dimensions(product)
    content_tag :li, product.dimensions unless product.dimensions.empty?
  end


  def tag_if_sold(product)
    "<span class='label label-important'>Sold</span>".html_safe if product.sold?
  end

  def tag_if_inactive(product)
    "<span class='label label-inverse'>Inactive</span>".html_safe unless product.active?
  end

  def edit_button_if_logged_in(product)
    if current_user and !visitor_view
      link_to 'Edit', edit_product_path(product), :class => "products-edit-button nice small white radius button no-print"
    end
  end

  def upload_images_button_if_logged_in(product)
    if current_user and !visitor_view
      link_to 'Upload Images', product, :class => "products-upload-button nice small white radius button no-print"
    end
  end

  def invoice_button_if_logged_in(product)
    if current_user and !visitor_view
      link_to 'Invoice', invoice_product_setup_path(Invoice, product), :class => "products-upload-button nice small white radius button no-print"
    end
  end

  def zero_products_blurb
    "There aren't any products in this category yet.  Please check back soon."
  end

  def subscribe_blurb
    "If you would like to be emailed once we have content available. Click #{link_to 'here', subscribe_path}".html_safe
  end
end
