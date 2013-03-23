module SlidersHelper

  def published(slider)
    if slider.active == true
      return "Active"
    else
      return "Inactive"
    end
  end

  def hidden_field_hlpr(slider,form)
    if slider.active?
      form.hidden_field :active, :value => false
    else
      form.hidden_field :active, :value => true
    end
  end

  def button_text_hlpr(slider)
    if slider.active?
      "Deactivate"
    else
      "Activate"
    end
  end

end
