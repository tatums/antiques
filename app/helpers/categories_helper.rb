module CategoriesHelper

  def published(category)
    if category.active == true
      return "Yes"
    else
      return "No"
    end    
  end

  def capitalize_title(category)
    category.title.split(" ").each{|word| word.capitalize!}.join(" ")
  end  

  def upcase_title(category)
    category.title.split(" ").each{|word| word.upcase!}.join(" ")
  end  

  def read_more(product)
      desc = product.body
      preview_words = 60
      total_words = desc.split.length
      if total_words < preview_words
        preview = desc          
      else
        preview = desc.split[0..preview_words].join(" ")+" ... "
      end
    return preview
  end  



  def activate_deactivate_category(category)
    if category.active
      button_to "Disable", toggle_category_path(category.slug)
    else
      button_to "Enable", toggle_category_path(category.slug)
    end
  end


end
