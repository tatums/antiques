module HomeHelper
  
  def slider_magic(slider) 
    if slider.product.nil?
      image_tag slider.image_url(:medium) 
    else
      link_to image_tag(slider.image_url(:medium) ), slider.product
    end   
  end

end
