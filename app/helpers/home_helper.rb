module HomeHelper

  def slider_magic(slider)
    if slider.product.nil?
      image_tag slider.image_url(:medium), alt: slider.title if slider.image?
    else
      link_to image_tag(slider.image_url(:medium), alt: slider.title ), slider.product
    end
  end

end
