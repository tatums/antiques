module HomeHelper

  def slider_magic(slider)
    if slider.product.nil?
      image_tag slider.image_url(:medium) if slider.image?
    else
      link_to image_tag(slider.image_url(:medium) ), slider.product
    end
  end

  # def read_more(product)
  #     desc = product.body
  #     preview_words = 35
  #     total_words = desc.split.length
  #     if total_words < preview_words
  #       preview = desc
  #     else
  #       preview = desc.split[0..preview_words].join(" ")+" ... "
  #     end
  #   return preview.html_safe
  # end

end
