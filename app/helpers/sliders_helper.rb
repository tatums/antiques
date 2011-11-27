module SlidersHelper

  def published(slider)
    if slider.active == true
      return "Active"
    else
      return "Inactive"
    end    
  end


  def activate_deactivate_button(slider)
    if slider.active
      button_to "Disable", toggle_slider_path(slider), :class=>'small red nice button radius'
    else
      button_to "Enable", toggle_slider_path(slider), :class=>'small white nice button radius'
    end
  end

end
